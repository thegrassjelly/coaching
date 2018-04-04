﻿<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Coaching_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Add Client Training
    
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>

    <script type="text/javascript">
        $(document).ready(function () {
            SearchUser();
        });
        // if you use jQuery, you can load them when dom is read.
        $(document).ready(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_initializeRequest(InitializeRequest);
            prm.add_endRequest(EndRequest);

        });

        function InitializeRequest(sender, args) {
        }

        function EndRequest(sender, args) {
            // after update occur on UpdatePanel re-init the Autocomplete
            SearchUser();
        }

        function SearchUser() {
            $("#<%=txtName.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "Add.aspx/GetName",
                        data: "{'prefixText':'" + request.term + "'}",
                        dataType: "json",
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return {
                                    label: item.split('/vn/')[0],
                                    val: item.split('/vn/')[1]
                                }
                            }))
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                },
                select: function (e, i) {
                    $("#<%=hfName.ClientID %>").val(i.item.val);
                },
                minLength: 2
            });
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Coaching Record
                        </div>
                        <div class="card-body">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <th></th>
                                    <th>Date of Record</th>
                                    <th>Fitness Goal</th>
                                    <th>Coaching Package</th>
                                    <th>Weight</th>
                                    <th></th>
                                </thead>
                                <tbody>
                                    <asp:ListView ID="lvCoaching" runat="server"
                                        OnPagePropertiesChanging="lvCoaching_OnPagePropertiesChanging"
                                        OnDataBound="lvCoaching_OnDataBound"
                                        OnItemCommand="lvCoaching_OnItemCommand">
                                        <ItemTemplate>
                                            <tr>
                                                <td>
                                                    <a href='<%# string.Concat("../clientprogress/", Eval("ProgressPic")) %>' data-lightbox="image-1">
                                                        <img id="Img1" runat="server" src='<%# string.Concat("~/clientprogress/", Eval("ProgressPic")) %>'
                                                             class="img-responsive" width="200" />
                                                    </a>
                                                </td>
                                                <td><%# Eval("DateAdded", "{0: MMMM d, yyyy}") %></td>
                                                <asp:Literal ID="ltTrainID" runat="server" Text='<%# Eval("TrainingID") %>' Visible="false" />
                                                <td><span class="label label-primary"><%# Eval("GoalSetting") %></span></td>
                                                <td><%# Eval("TrainingPackage") %></td>
                                                <td><%# Eval("Weight") %> kg</td>
                                                <td>
                                                    <asp:Button ID="btnCoachingInfo" CommandName="coachingDetails"
                                                                class="btn btn-sm btn-primary" runat="server" Text='View Coaching Details'
                                                                OnSubmitBehavior="false" 
                                                                formnovalidate />
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
                        <div class="card-footer">
                            <center>
                                <asp:DataPager id="dpCoachHist" runat="server" pageSize="5" PagedControlID="lvCoaching">
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
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-header">
                            Client Details
                        </div>
                        <div class="card-body">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Search Client</label>
                                </div>
                                <div class="col-lg-7 col-md-7">
                                    <asp:TextBox ID="txtName" class="form-control" 
                                                 runat="server" />
                                </div>
                                <div class="col-lg-2">
                                    <asp:LinkButton ID="btnUser" runat="server" OnClick="btnUser_OnClick" CssClass="btn btn-success"> 
                                            <i class="fa fa-refresh"></i></asp:LinkButton>
                                </div>
                                <asp:HiddenField runat="server" Value="0" ID="hfName" />
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">First Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtFN" class="form-control" 
                                                 runat="server" disabled />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Last Name</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtLN" class="form-control" 
                                                 runat="server" disabled />
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
                                                     runat="server" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Email Address</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtEmail" class="form-control" 
                                                 runat="server" disabled />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Mobile No.</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-phone"></i></div>
                                        <asp:TextBox ID="txtMobile" class="form-control" 
                                                     runat="server" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Address</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtAddr" class="form-control" 
                                                 TextMode="Multiline" runat="server" 
                                                 style="max-width: 100%;" disabled />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Status</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtStatus" class="form-control" 
                                                 runat="server" disabled />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            Coaching Details
                        </div>
                        <div class="card-body">
                            <div class="col-lg-6">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label for="file-input" class="form-control-label">Progress Photo</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:FileUpload ID="usrPicUpload" runat="server" class="file" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Age</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtAge" class="form-control" 
                                                     Placeholder="Age" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Weight</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtWeight" class="form-control" 
                                                     Placeholder="Weigh (in kg)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Height</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtHeight" class="form-control" 
                                                     Placeholder="Height (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Arms</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtArms" class="form-control" 
                                                     Placeholder="Arms (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Chest</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtChst" class="form-control" 
                                                     Placeholder="Chest (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Waist</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtWst" class="form-control" 
                                                     Placeholder="Waist (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Hip</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtHip" class="form-control" 
                                                     Placeholder="Hip (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Thigh</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtThgh" class="form-control" 
                                                     Placeholder="Thigh (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Legs</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtLgs" class="form-control" 
                                                     Placeholder="Legs (in cm)" 
                                                     TextMode="Number" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Fitness Goal</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:DropDownList ID="ddlGoal" class="form-control" runat="server">
                                            <asp:ListItem>Weight Loss</asp:ListItem>
                                            <asp:ListItem>Weight Gain</asp:ListItem>
                                            <asp:ListItem>Tone and Shape</asp:ListItem>
                                            <asp:ListItem>Muscle Gain</asp:ListItem>
                                            <asp:ListItem>Endurance</asp:ListItem>
                                            <asp:ListItem>Health Improvement</asp:ListItem>
                                            <asp:ListItem>Decrease BP</asp:ListItem>
                                            <asp:ListItem>Improve Posture</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Coaching Package</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:DropDownList ID="ddlPackage" class="form-control" runat="server">
                                            <asp:ListItem>Single Session</asp:ListItem>
                                            <asp:ListItem>Monthly Session</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Coaching Fee</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtCoachFee" class="form-control"
                                            TextMode="number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Time of Record</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtCurrentDate" class="form-control" runat="server" 
                                                     TextMode="date" required />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-4">
                                        <b><label class="form-control-label">Training Schedule</label></b>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Mon</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:CheckBox ID="chkMon" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Tue</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:CheckBox ID="chkTues" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Wed</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:CheckBox ID="chkWed" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Thur</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:CheckBox ID="chkThurs" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Fri</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:CheckBox ID="chkFri" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Sat</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:CheckBox ID="chkSat" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="pull-right">
                                <asp:Button ID="btnBack" class="btn btn-success" runat="server" Text="Back" OnClick="btnBack_OnClick" formnovalidate />
                                <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="Add"
                                            OnClientClick="return confirm('Are you sure?')" OnClick="btnSubmit_OnClick" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>
