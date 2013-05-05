using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace Clancy_Gets_A_Divorce___Form
{
    public partial class frmClancy : Form
    {
        public frmClancy()
        {
            InitializeComponent();
        }

        private void btnStart_Click(object sender, EventArgs e)
        {
            Form frmClancysBigDay = new frmClancysBigDay();
            frmClancysBigDay.Show();
        }
    }
}
