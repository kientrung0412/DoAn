using System;
using System.Drawing;
using System.Windows.Forms;
using WindowsFormsApp4.Entity;
using WindowsFormsApp4.Imp;

namespace WindowsFormsApp4
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();

//            button.Text = mdEmployess.Login().ToString();
//
//            for (int i = 0; i < 10; i++)
//            {
//                String btnName = String.Format("btn_{0}", i);
//                Button btn = new Button();
//                btn.Name = btnName;
//                btn.Text = btnName;
//                btn.TabIndex = 0;
//                btn.ForeColor = Color.Red;
//                btn.Location = new Point((12 + i * 100), 12);
//                btn.Margin = new Padding(3);
//                btn.Size = new Size(95, 35);
//                btn.UseVisualStyleBackColor = true;
//                this.Controls.Add(btn);
//            }
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Employess employess = new Employess();
            employess.Phone = "0835042790";
            employess.Passsword = "1234";
            button1.Text = mdEmployess.Login(employess).ToString();
        }
    }
}