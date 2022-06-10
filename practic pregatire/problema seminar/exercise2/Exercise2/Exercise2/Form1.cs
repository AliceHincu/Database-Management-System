using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Exercise2
{
    public partial class Form1 : Form
    {
        SqlConnection myConnection;
        SqlDataAdapter userDA, postDA;
        DataSet myDataSet;
        SqlCommandBuilder myCommandBuilder;
        BindingSource UserBindingSource, PostBindingSource;

        private void button1_Click(object sender, EventArgs e)
        {
            myConnection = new SqlConnection(@"Data Source = DESKTOP-3CQ6S32; Initial Catalog = MiniFacebook; Integrated Security = True");
            myDataSet = new DataSet();
            userDA = new SqlDataAdapter("select * from Users", myConnection);
            postDA = new SqlDataAdapter("select * from Posts", myConnection);
            myCommandBuilder = new SqlCommandBuilder(postDA); // the table used in UPDATE

            userDA.Fill(myDataSet, "Users"); //parent table
            postDA.Fill(myDataSet, "Posts"); //child table

            DataRelation myDataRelation = new DataRelation("FK_Users_Posts",
                 myDataSet.Tables["Users"].Columns["UserId"],
                 myDataSet.Tables["Posts"].Columns["UserId"]);
            myDataSet.Relations.Add(myDataRelation);

            UserBindingSource = new BindingSource(); // PARENT
            PostBindingSource = new BindingSource(); // CHILD

            UserBindingSource.DataSource = myDataSet;
            UserBindingSource.DataMember = "Users";

            PostBindingSource.DataSource = UserBindingSource;
            PostBindingSource.DataMember = "FK_Users_Posts";


            dgvPosts.DataSource = PostBindingSource;
            dgvUsers.DataSource = UserBindingSource;
        }

        private void btnUpdateDB_Click(object sender, EventArgs e)
        {
            postDA.Update(myDataSet, "Posts");
        }

        public Form1()
        {
            InitializeComponent();
        }
    }
}
