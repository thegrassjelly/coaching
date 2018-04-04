<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Users_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Add Clients
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">
                    <strong>Client Details</strong>
                </div>
                <div class="card-body card-block">
                    <div class="col-lg-6">
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label for="file-input" class="form-control-label">Client Photo</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">First Name</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtFN" class="form-control" 
                                             Placeholder="First Name" runat="server" required />
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Last Name</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtLN" class="form-control" 
                                             Placeholder="Last Name" runat="server" required />
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Date of Birth</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                    <asp:TextBox ID="txtBday" class="form-control" 
                                                 TextMode="Date" runat="server" required />
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Email Address</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtEmail" class="form-control" 
                                             Placeholder="Email Address" runat="server" required />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Mobile No.</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                    <asp:TextBox ID="txtMobile" class="form-control" 
                                                 Placeholder="Mobile No."
                                                 TextMode="Number" runat="server" required />
                                </div>
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Address</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:TextBox ID="txtAddr" class="form-control" 
                                             Placeholder="Address" 
                                             TextMode="Multiline" runat="server" 
                                             style="max-width: 100%;" />
                            </div>
                        </div>
                        <div class="row form-group">
                            <div class="col col-md-3">
                                <label class="form-control-label">Status</label>
                            </div>
                            <div class="col-12 col-md-9">
                                <asp:DropDownList id="ddlStatus" class="form-control"
                                                  runat="server">
                                    <asp:ListItem>Active</asp:ListItem>
                                    <asp:ListItem>Inactive</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <div class="pull-right">
                        <asp:Button ID="btnSubmit" class="btn btn-primary" 
                                    runat="server" Text="Add Client" OnClick="btnSubmit_OnClick" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

