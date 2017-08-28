using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FinalProject_Extension.Forms
{
    public partial class PlayerPrompt : Form
    {

        private static bool homeTeamVar;
        List<TextBox> textBoxes = new List<TextBox>();
        public Data.Team team = new Data.Team();

        public PlayerPrompt(bool homeTeam, ref Data.Team teamPassed)
        {
            InitializeComponent();

            team = teamPassed;

            if (homeTeam)
            {
                Prompt_Label.Text = "Please enter players for the home team.";
                homeTeamVar = homeTeam;
            }
            else
            {
                Prompt_Label.Text = "Please enter players for the away team.";
                homeTeamVar = homeTeam;
            }

            // Indices 0-2
            textBoxes.Add(Pitcher_FirstName_TextBox);
            textBoxes.Add(Pitcher_LastName_TextBox);
            textBoxes.Add(Pitcher_Number_TextBox);

            // Indices 3-5
            textBoxes.Add(Catcher_FirstName_TextBox);
            textBoxes.Add(Catcher_LastName_TextBox);
            textBoxes.Add(Catcher_Number_TextBox);

            // Indices 6-8
            textBoxes.Add(First_FirstName_TextBox);
            textBoxes.Add(First_LastName_TextBox);
            textBoxes.Add(First_Number_TextBox);

            // Indices 9-11
            textBoxes.Add(Second_FirstName_TextBox);
            textBoxes.Add(Second_LastName_TextBox);
            textBoxes.Add(Second_Number_TextBox);

            // Indices 12-14
            textBoxes.Add(Third_FirstName_TextBox);
            textBoxes.Add(Third_LastName_TextBox);
            textBoxes.Add(Third_Number_TextBox);

            // Indices 15-17
            textBoxes.Add(Shortstop_FirstName_TextBox);
            textBoxes.Add(Shortstop_LastName_TextBox);
            textBoxes.Add(Shortstop_Number_TextBox);

            // Indices 18-20
            textBoxes.Add(Left_FirstName_TextBox);
            textBoxes.Add(Left_LastName_TextBox);
            textBoxes.Add(Left_Number_TextBox);

            // Indices 21-23
            textBoxes.Add(Center_FirstName_TextBox);
            textBoxes.Add(Center_LastName_TextBox);
            textBoxes.Add(Center_Number_TextBox);

            // Indices 24-26
            textBoxes.Add(Right_FirstName_TextBox);
            textBoxes.Add(Right_LastName_TextBox);
            textBoxes.Add(Right_Number_TextBox);

            // Indices 27-29
            textBoxes.Add(BenchFirst_FirstName_TextBox);
            textBoxes.Add(BenchFirst_LastName_TextBox);
            textBoxes.Add(BenchFirst_Number_TextBox);

            // Indices 30-32
            textBoxes.Add(BenchSecond_FirstName_TextBox);
            textBoxes.Add(BenchSecond_LastName_TextBox);
            textBoxes.Add(BenchSecond_Number_TextBox);

            // Indices 33-35
            textBoxes.Add(BenchThird_FirstName_TextBox);
            textBoxes.Add(BenchThird_LastName_TextBox);
            textBoxes.Add(BenchThird_Number_TextBox);

            // Indices 36-38
            textBoxes.Add(BenchFourth_FirstName_TextBox);
            textBoxes.Add(BenchFourth_LastName_TextBox);
            textBoxes.Add(BenchFourth_Number_TextBox);
        }

        private void Done_Button_Click(object sender, EventArgs e)
        {
            int count = 0;
            int position = 0;
            string firstName = "";
            string lastName = "";
            int number;

            foreach (TextBox textbox in textBoxes)
            {
                if (string.IsNullOrWhiteSpace(textbox.Text.Trim()))
                {
                    MessageBox.Show("Please make sure all boxes are filled in.");
                    return;
                }
                else
                {
                    if (count == 0)
                    {
                        firstName = textbox.Text.Trim();
                        count++;
                    }
                    else if (count == 1)
                    {
                        lastName = textbox.Text.Trim();
                        count++;
                    }
                    else if (count == 2)
                    {
                        number = Convert.ToInt32(textbox.Text.Trim());
                        Data.Player newPlayer = new Data.Player(firstName, lastName, number, position);
                        team.roster.Add(newPlayer);
                        count = 0;
                        position++;
                    }
                    else
                    {
                        MessageBox.Show("ERROR - something went wrong. Please restart application.");
                        Application.Exit();
                    }
                }
            }

            this.DialogResult = DialogResult.OK;
            this.Close();
        }

        private void Cancel_Button_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Goodbye");
            this.DialogResult = DialogResult.Cancel;
            this.Close();
        }

        public Data.Team theTeam()
        {
            return this.team;
        }
    }
}
