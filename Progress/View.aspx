<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="View.aspx.cs" Inherits="Progress_View" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Client Progress Gallery
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server" />
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Client Progress
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-2">
                                    <div class="input-group">
                                        <asp:DropDownList ID="ddlGoal" runat="server" class="form-control"
                                                          AutoPostBack="True" OnSelectedIndexChanged="ddlGoal_OnSelectedIndexChanged">
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="col-lg-10">
                                    <div class="input-group">
                                        <asp:TextBox ID="txtSearch" runat="server" class="form-control autosuggest"
                                                     placeholder="Client Name" OnTextChanged="txtSearch_OnTextChanged" AutoPostBack="true" />
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
                                        <th>Goal Setting</th>
                                        <th>Age</th>
                                        <th>Weight</th>
                                        <th>Date Added</th>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lvProgress" runat="server"
                                            OnPagePropertiesChanging="lvProgress_OnPagePropertiesChanging"
                                            OnDataBound="lvProgress_OnDataBound">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <a href='<%# string.Concat("../clientprogress/", Eval("ProgressPicFront")) %>' data-lightbox="image-1">
                                                            <img id="Img1" runat="server" src='<%# string.Concat("~/clientprogress/", Eval("ProgressPicFront")) %>'
                                                                 class="img-responsive" width="200" />
                                                        </a>
                                                    </td>
                                                    <td><%# Eval("LastName") %>, <%# Eval("FirstName") %> </td>
                                                    <td><%# Eval("GoalSetting") %></td>
                                                    <td><%# Eval("Age") %> Yrs. Old</td>
                                                    <td><%# Eval("Weight") %> Kg</td>
                                                    <td><%# Eval("DateAdded", "{0: dddd, MMMM d, yyyy}") %></td>
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
                                <asp:DataPager id="dpProgress" runat="server" pageSize="10" PagedControlID="lvProgress">
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


