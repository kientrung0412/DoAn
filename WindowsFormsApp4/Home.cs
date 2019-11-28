using System;
using System.Windows.Forms;

namespace WindowsFormsApp4
{
    public partial class Home : Form
    {
        public Home()
        {
            InitializeComponent();
            listView1.SmallImageList = imageList1;
            for (int  i = 0;  i < imageList1.Images;  i++)
            {
                
            }
            
        }

        private void button1_Click(object sender, EventArgs e)
        {
            throw new System.NotImplementedException();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            throw new System.NotImplementedException();
        }
    }
}