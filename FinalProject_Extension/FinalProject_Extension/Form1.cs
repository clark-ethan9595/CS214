using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FinalProject_Extension
{
    public partial class Form1 : Form
    {

        List<Label> fieldList = new List<Label>();
        List<Label> hittingList = new List<Label>();
        Data.Team homeTeam = new Data.Team();
        Data.Team awayTeam = new Data.Team();
        int inning = 1;
        bool topOfInning = true;

        public Form1()
        {
            InitializeComponent();

            Application.Run(new Forms.PlayerPrompt(true, ref homeTeam));
            Application.Run(new Forms.PlayerPrompt(false, ref awayTeam));

            Pitcher_Label.Parent = diamondPicture;
            Catcher_Label.Parent = diamondPicture;
            First_Label.Parent = diamondPicture;
            Second_Label.Parent = diamondPicture;
            Shortstop_Label.Parent = diamondPicture;
            Third_Label.Parent = diamondPicture;
            Left_Label.Parent = diamondPicture;
            Center_Label.Parent = diamondPicture;
            Right_Label.Parent = diamondPicture;

            Batter_Label.Parent = diamondPicture;
            OnDeckOne_Label.Parent = diamondPicture;
            OnDeckTwo_Label.Parent = diamondPicture;
            OnDeckThree_Label.Parent = diamondPicture;

            OnDeck_Label.Parent = diamondPicture;

            fieldList.Add(Pitcher_Label);
            fieldList.Add(Catcher_Label);
            fieldList.Add(First_Label);
            fieldList.Add(Second_Label);
            fieldList.Add(Shortstop_Label);
            fieldList.Add(Third_Label);
            fieldList.Add(Left_Label);
            fieldList.Add(Center_Label);
            fieldList.Add(Right_Label);

            hittingList.Add(Batter_Label);
            hittingList.Add(OnDeckOne_Label);
            hittingList.Add(OnDeckTwo_Label);
            hittingList.Add(OnDeckThree_Label);

            displayPlayersOnField(topOfInning);
            displayHittingPlayers(topOfInning);
        }

        public void displayPlayersOnField(bool TopOfInning)
        {

            if (TopOfInning)
            {
                for (int i = 0; i < 9; i++)
                {
                    fieldList[i].Text = homeTeam.roster[i].getFullName();
                }
            }
            else
            {
                for (int i = 0; i < 9; i++)
                {
                    fieldList[i].Text = awayTeam.roster[i].getFullName();
                }
            }

            foreach (Label label in fieldList)
            {
                label.Visible = true;
            }
        }

        public void displayHittingPlayers(bool TopOfInning)
        {
            if (TopOfInning)
            {
                for (int i = 0; i < 4; i++)
                {
                    hittingList[i].Text = awayTeam.roster[awayTeam.hittingPosition].getFullName();
                }
            }
            else
            {
                for (int i = 0; i < 4; i++)
                {
                    hittingList[i].Text = homeTeam.roster[homeTeam.hittingPosition].getFullName();
                }
            }

            foreach (Label label in hittingList)
            {
                label.Visible = true;
            }
        }

        private void displayInning()
        {
            if (topOfInning)
            {
                TopOrBottom_Inning_Label.Text = "Top";
            }
            else
            {
                TopOrBottom_Inning_Label.Text = "Bottom";
            }

            InningNumber_Label.Text = inning.ToString();
        }
    }
}
