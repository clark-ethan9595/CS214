using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FinalProject_Extension.Data
{
    public class Team
    {

        public List<Player> roster = new List<Player>();

        public string teamCity;
        public string teamMascot;

        public int hittingPosition = 0;

        public Team()
        {

        }

        public int getNumberPlayers()
        {
            return roster.Count;
        }

        public Player getPlayer(int position)
        {
            return roster[position];
        }
    }
}
