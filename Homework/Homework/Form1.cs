//namespaces
using System.Data;
using System.Data.SqlClient;

namespace Homework
{
    public partial class Form1 : Form
    {
        SqlConnection dbConn;
        SqlDataAdapter daCustomers, daOrders;
        DataSet ds;
        SqlCommandBuilder cb;
        BindingSource bsCustomers, bsOrders;

        private void btnUpdateDB_Click(object sender, EventArgs e)
        {
            daOrders.Update(ds, "Animals");
            this.Form1_Load(sender, e);

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            
            dbConn = new SqlConnection(@"Data Source = DESKTOP-3CQ6S32; Initial Catalog = HowlOfADog; Integrated Security = true");
            ds = new DataSet();
            daCustomers = new SqlDataAdapter("SELECT * FROM Cages", dbConn);
            daOrders = new SqlDataAdapter("SELECT * FROM Animals", dbConn);
            cb = new SqlCommandBuilder(daOrders);

            daCustomers.Fill(ds, "Cages");
            daOrders.Fill(ds, "Animals");

            DataRelation dr = new DataRelation("FK_Animal_Cage", 
                ds.Tables["Cages"].Columns["CageID"], 
                ds.Tables["Animals"].Columns["CageID"]);
            ds.Relations.Add(dr);
            //data binding
            bsCustomers = new BindingSource();
            bsCustomers.DataSource = ds;
            bsCustomers.DataMember = "Cages";
            bsOrders = new BindingSource();
            bsOrders.DataSource = bsCustomers;
            bsOrders.DataMember = "FK_Animal_Cage";
            dgvCustomers.DataSource = bsCustomers;
            dgvOrders.DataSource = bsOrders;
            
        }

        public Form1()
        {
            InitializeComponent();
        }
    }
}