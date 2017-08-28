using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject_Extension.Data
{
    public class Player
    {
        public string firstName { get; set; }
        public string lastName { get; set; }
        public int number { get; set; }
        public int position { get; set; }
        public int singles { get; set; }
        public int doubles { get; set; }
        public int triples { get; set; }
        public int homeRuns { get; set; }
        public int walks { get; set; }
        public int errors { get; set; }
        public int strikeouts { get; set; }
        public int RBIs { get; set; }
        public int runs { get; set; }

        public Player(string firstName, string lastName, int number, int position)
        {
            this.firstName = firstName;
            this.lastName = lastName;
            this.number = number;
            this.position = position;
            this.singles = 0;
            this.doubles = 0;
            this.triples = 0;
            this.homeRuns = 0;
            this.walks = 0;
            this.errors = 0;
            this.strikeouts = 0;
            this.RBIs = 0;
            this.runs = 0;
        }

        public string getFullName()
        {
            return this.firstName + " " + this.lastName;
        }
    }
}
