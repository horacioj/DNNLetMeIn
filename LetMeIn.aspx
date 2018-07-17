<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="System.Reflection" %>
<%@ Import Namespace="System.Web.UI" %>
<%@ Import Namespace="System.Text" %>
<%@ Import Namespace="System.Collections.Generic" %>

<%@ Import Namespace="DotNetNuke" %>
<%@ Import Namespace="DotNetNuke.Data" %>
<%@ Import Namespace="DotNetNuke.Security" %>
<%@ Import Namespace="DotNetNuke.Entities.Users" %>
<%@ Import Namespace="DotNetNuke.Entities.Profile" %>

<!--
=== DNN Create a Host User tool ===
Created by: Horacio Judeikin (www.evotiva.com)
License: Distributed under the terms of the MIT License
Created : Aug 10, 2010 
Updated: Jul 10, 2017
-->

<script language="C#" runat="server">  
    
    #region ---------------------- Events ----------------------
      
    ///////////////////////////////////////////////////////////////////////
    protected void btnGo_Click(object sender, EventArgs e)
    {
        try
        {
			ClearResults();
            
            if  (txtUsername.Text.Trim() != string.Empty 
				 && txtPassword.Text.Trim() != string.Empty
				 && txtEmail.Text.Trim() != string.Empty)
            {       
			
				DotNetNuke.Security.Membership.UserCreateStatus userCreateStatus 
							= CreateUser(Convert.ToInt32(txtPortalId.Text), txtUsername.Text.Trim(), txtPassword.Text.Trim(), txtEmail.Text.Trim());
				if (userCreateStatus == DotNetNuke.Security.Membership.UserCreateStatus.Success)
					lblResults.Text = "OK - The user has been created.";
				else
					lblError.Text = string.Format("Error [{0}] - the user was NOT created.", userCreateStatus);
            }
			else
			{
				lblError.Text = "Error - all fields must be set. The request was not submitted.";
			}
			
        }
        catch (Exception ex)
        {
            lblError.Text = ex.ToString();
        }
    }
    
    #endregion

    
    #region ---------------------- Private Methods ----------------------

    ///////////////////////////////////////////////////////////////////////
    private void ClearResults()
    {
        this.lblError.Text = this.lblResults.Text = string.Empty;
    }
	
	//////////////////////////////////////////////////////////////////////
	private DotNetNuke.Security.Membership.UserCreateStatus CreateUser(int portalid, string username, string password, string email)
	{
		UserInfo uInfo = new UserInfo();
		uInfo.PortalID = Convert.ToInt32(portalid);
        uInfo.Username = username;
		uInfo.DisplayName = username;
        uInfo.FirstName = username;
        uInfo.LastName = username;
        uInfo.Email = email;	
        uInfo.IsSuperUser = true;
		uInfo.Membership.Password = password;
		
		return UserController.CreateUser(ref uInfo);
	}

    #endregion

</script>


<!DOCTYPE html>
<html lang="en-US">
<head runat="server">
<!--************************************************-->
<!-- DNN Create Host User tool                      --> 
<!-- Created by: Horacio Judeikin (www.evotiva.com) -->
<!--************************************************-->
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type" />
    <meta http-equiv="cache-control" content="no-cache" />
    <meta http-equiv="pragma" content="no-cache" />
    <meta name="author" content="Horacio Judeikin - www.evotiva.com" />
    <meta name="description" content="DNN Create Host User tool" />
    <title>LetMeIn - DNN Create Host User</title>
	<style>
		
        body {
            font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
            margin-top: 20px; 
            margin-left: 20px;
        }

        h1, h2, h3 {
            margin-top: 5px;
            margin-bottom: 5px;
        }
        
        h1 {
            font-size: 145%;
        }

        h2 {
            margin-top: 15px;
            font-size: 135%;
        }

        h3 {
            font-size: 110%;
            color: #2170cd;
        }

        footer {
            font-size: 75%;
        }	

        fieldset {
            margin-top: 15px;
            border: 0;
        }
        
        label {
            display: inline-block;
            font-weight: 700;
            width: 100px;
            text-align: right;
        }

        input[type=text], input[type=password] {
            display: inline-block;
            padding: 10px;
            margin: 5px;
            border: 1px solid #e7e6dc;            
        }	

        input[type="submit"] {
            margin-top: 20px;
            padding: 10px;            
            color: white;
            background: #3792ED;
            background: -moz-linear-gradient(top, #358eea 0%, #2170cd 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#358eea), color-stop(100%,#2170cd));
            background: -webkit-linear-gradient(top, #358eea 0%,#2170cd 100%);
            background: linear-gradient(top, #358eea 0%,#2170cd 100%);
            -webkit-box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.6), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4);
            box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.6), inset 0px 1px 0px 0px rgba(255, 255, 255, 0.4);
            text-shadow: 0px -1px 0px #185B93;
        }

        .message, .error {
            font-weight: 700;
        }

        .error {
            color: red;
        }

	</style>	
</head>

<body>
    <form id="frmFindAndReplace" runat="server">
        <div>
            <h1>LetMeIn</h1>
            <footer> <a href="https://www.evotiva.com" target="_blank">by evotiva.com</a> </footer>
            <h2>DNN Emergency Create Host User Tool</h2>
            <h3>IMPORTANT: Do not leave this page on the site - please remember to delete me!</h3>
            <asp:Panel ID="pnlForm" runat="server">

                <fieldset>
                    <div>
                        <label>Portal Id *:</label>
                        <asp:TextBox ID="txtPortalId" Columns="5" runat="server" Text="0" />
                    </div>
        
                    <div>
                        <label>Username *:</label>
                        <asp:TextBox ID="txtUsername" Columns="30" runat="server" Text="deleteme"  />
                    </div>
        
                    <div>
                        <label>Password *:</label>
                        <asp:TextBox ID="txtPassword" Columns="30" runat="server" />
                    </div>
        
                    <div>
                        <label>Email *:</label>
                        <asp:TextBox ID="txtEmail" Columns="50" runat="server"  Text="deleteme@example.com"/>
                    </div>
        
                    <div>
                        <asp:Button ID="btnGo" CssClass="CommandButton" runat="server" Text="Create Super User" 
                                    OnClick="btnGo_Click" OnClientClick="javascript:return confirm('Confirm superuser creation?');"
                        />
                    </div>
                </fieldset>
    
                <p class="message">
                    <asp:Label ID="lblResults" runat="server" Text="" />
                </p>
                <p class="error">
                    <asp:Label ID="lblError" runat="server" Text="" />
                </p>
    
            </asp:Panel>
        </div>
    </form>    
</body>
</html>
