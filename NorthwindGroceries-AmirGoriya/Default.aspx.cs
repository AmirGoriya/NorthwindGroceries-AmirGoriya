using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NorthwindGroceries_AmirGoriya
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Makes the discontinued toggle button visible only if a category of products is being viewed.
            if (Request.QueryString["CategoryID"] != null)
            {
                btnToggleDiscontinued.CssClass = "btn btn-secondary mb-2";
            }
            else
            {
                btnToggleDiscontinued.CssClass = "btn btn-secondary mb-2 d-none";
            }
        }

        protected void btnToggleDiscontinued_Click(object sender, EventArgs e)
        {
            if (btnToggleDiscontinued.Text == "Hide Discontinued")
            {
                btnToggleDiscontinued.Text = "Show All";
                dsProductList.SelectCommand = $"SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = {Request.QueryString["CategoryID"]}) AND ([Discontinued] = 'False')";
            }
            else if (btnToggleDiscontinued.Text == "Show All")
            {
                btnToggleDiscontinued.Text = "Hide Discontinued";
                dsProductList.SelectCommand = $"SELECT [ProductID], [ProductName], [QuantityPerUnit], [UnitPrice], [Discontinued] FROM [Products] WHERE ([CategoryID] = {Request.QueryString["CategoryID"]})";
            }
        }
    }
}