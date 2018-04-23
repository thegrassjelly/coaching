<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Users_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Client List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Client List</strong>
                        </div>
                        <div class="card-body card-block">
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control"
                                            AutoPostBack="True" OnSelectedIndexChanged="ddlStatus_OnSelectedIndexChanged">
                                            <asp:ListItem Text="Active" Value="Active" />
                                            <asp:ListItem Text="Inactive" Value="Inactive" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-10">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtSearch" runat="server" class="form-control autosuggest"
                                            placeholder="Keyword..." OnTextChanged="txtSearch_OnTextChanged" AutoPostBack="true" />
                                        <span class="input-group-btn">
                                            <asp:LinkButton ID="btnSearch" runat="server" class="btn btn-info"
                                                OnClick="btnSearch_OnClick">
                                      <i class="fa fa-search"></i>
                                            </asp:LinkButton>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <br />
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <th></th>
                                        <th>Name</th>
                                        <th>Mobile No.</th>
                                        <th>Birthday</th>
                                        <th>Status</th>
                                        <th>Date Added</th>
                                        <th>Date Modified</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lvUsers" runat="server"
                                            OnPagePropertiesChanging="lvUsers_OnPagePropertiesChanging"
                                            OnDataBound="lvUsers_OnDataBound"
                                            OnItemCommand="lvUsers_OnItemCommand" >
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <a href='<%# string.Concat("../clientpics/", Eval("UserPic")) %>' data-lightbox="image-1">
                                                            <img id="Img1" runat="server" src='<%# string.Concat("~/clientpics/", Eval("UserPic")) %>'
                                                                 class="img-responsive" width="200" />
                                                        </a>
                                                    </td>
                                                    <asp:Literal ID="ltUserID" runat="server" Text='<%# Eval("UserID") %>' Visible="false" />
                                                    <td><%# Eval("LastName") %>, <%# Eval("FirstName") %> </td>
                                                    <td><%# Eval("MobileNo") %></td>
                                                    <td><%# Eval("Birthday", "{0: MMMM d, yyyy}") %></td>
                                                    <td>
                                                        <span class='<%# Eval("Status").ToString() == "Inactive" ? "label label-danger" : "label label-success"%>'>
                                                            <%# Eval("Status") %>
                                                        </span>
                                                    </td>
                                                    <td><%# Eval("DateAdded", "{0: dddd, MMMM d, yyyy}") %></td>
                                                    <td><%# Eval("DateModified", "{0: dddd, MMMM d, yyyy}") %></td>
                                                    <td>
                                                        <a href='ClientSummary.aspx?ID=<%# Eval("UserID") %>'>
                                                            <button type="button" class="btn btn-sm btn-success">Summary</button>
                                                        </a>
                                                        <a href='UpdateUsers.aspx?ID=<%# Eval("UserID") %>'>
                                                            <button type="button" class="btn btn-sm btn-primary">Update Details</button>
                                                        </a>
                                                        <asp:Button ID="btnRemoveUser" CommandName="deluser"
                                                                    class="btn btn-sm btn-danger" runat="server" Text='Remove Client'
                                                                    OnSubmitBehavior="false" 
                                                                    OnClientClick='return confirm("Are you sure?");' formnovalidate />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                            <EmptyDataTemplate>
                                                <tr>
                                                    <td colspan="12">
                                                        <h2 class="text-center">No records found.</h2>
                                                    </td>
                                                </tr>
                                            </EmptyDataTemplate>
                                        </asp:ListView>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="card-footer">
                            <center>
                                <asp:DataPager id="dpUsers" runat="server" pageSize="10" PagedControlID="lvUsers">
                                    <Fields>
                                        <asp:NumericPagerField Buttontype="Button"
                                                               NumericButtonCssClass="btn btn-default"
                                                               CurrentPageLabelCssClass="btn btn-success"
                                                               NextPreviousButtonCssClass ="btn btn-default" 
                                                               ButtonCount="10" />
                                    </Fields>
                                </asp:DataPager>
                            </center>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

