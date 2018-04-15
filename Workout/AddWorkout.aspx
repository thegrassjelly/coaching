<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="AddWorkout.aspx.cs" Inherits="Coaching_AddWorkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    Client Workout Log
    
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            SearchUser();
            WorkoutName();
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
            WorkoutName();
        }

        function SearchUser() {
            $("#<%=txtName.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddWorkout.aspx/GetName",
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

        function WorkoutName() {
            $("#<%=txtWorkoutNme.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "AddWorkout.aspx/SearchWorkout",
                        data: "{'prefixText':'" + document.getElementById('<%=txtWorkoutNme.ClientID%>').value + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error" + result.result);
                        }
                    });
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Workout Details
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <th></th>
                                        <th>Session #</th>
                                        <th>Date Added</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lvWorkoutList" runat="server"
                                            OnPagePropertiesChanging="lvWorkoutList_OnPagePropertiesChanging"
                                            OnDataBound="lvWorkoutList_OnDataBound"
                                            OnItemCommand="lvWorkoutList_OnItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td></td>
                                                    <td><%# Eval("SessionNumber") %></td>
                                                    <asp:Literal ID="ltWList" runat="server" Text='<%# Eval("WorkoutID") %>' Visible="false" />

                                                    <td><%# Eval("DateAdded", "{0: MMMM d, yyyy}") %></td>
                                                    <td>
                                                        <asp:Button ID="btnWorkoutD" CommandName="details"
                                                            class="btn btn-sm btn-primary" runat="server" Text='Workout Details'
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
                        </div>
                        <div class="card-footer">
                            <center>
                                <asp:DataPager id="dpWorkoutList" runat="server" pageSize="3" PagedControlID="lvWorkoutList">
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
                                        Style="max-width: 100%;" disabled />
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
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            Workout Details
                        </div>
                        <div class="card-body">
                            <div id="pnlClient" runat="server" visible="false">
                                <div class="alert alert-danger">
                                    <b>Select a client first</b>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Body Part</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:DropDownList ID="ddlBodyPart" class="form-control"
                                            runat="server">
                                            <asp:ListItem>Chest</asp:ListItem>
                                            <asp:ListItem>Back</asp:ListItem>
                                            <asp:ListItem>Biceps</asp:ListItem>
                                            <asp:ListItem>Triceps</asp:ListItem>
                                            <asp:ListItem>Legs</asp:ListItem>
                                            <asp:ListItem>Abs</asp:ListItem>
                                            <asp:ListItem>Shoulder</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Workout Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtWorkoutNme" class="form-control"
                                            runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Weight</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtWeight" class="form-control"
                                                     TextMode="number" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Repetitions</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtReps" class="form-control"
                                            TextMode="Number" runat="server" />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Sets</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtSets" class="form-control"
                                            TextMode="Number" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="pull-right">
                                <asp:Button ID="btnBack" class="btn btn-success" runat="server" Text="Back" OnClick="btnBack_OnClick" formnovalidate />
                                <asp:Button ID="btnAdd" class="btn btn-primary" runat="server" Text="Add" OnClick="btnAdd_OnClick" />
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-8">
                    <div class="card">
                        <div class="card-header">
                            Workout Details
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <th>Body Part</th>
                                        <th>Workout Name</th>
                                        <th>Weight</th>
                                        <th>Repetitions</th>
                                        <th>Sets</th>
                                        <th>Date Added</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lvWorkout" runat="server"
                                            OnPagePropertiesChanging="lvWorkout_OnPagePropertiesChanging"
                                            OnDataBound="lvWorkout_OnDataBound"
                                            OnItemCommand="lvWorkout_OnItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("BodyPart") %></td>
                                                    <asp:Literal ID="ltWorkID" runat="server" Text='<%# Eval("WorkoutDetailsID") %>' Visible="false" />
                                                    <td><%# Eval("Repetitions") %></td>
                                                    <td><%# Eval("WorkoutName") %></td>
                                                    <td><%# Eval("Weight") %> kg</td>
                                                    <td><%# Eval("Sets") %></td>
                                                    <td><%# Eval("DateAdded", "{0: MMMM d, yyyy}") %></td>
                                                    <td>
                                                        <asp:Button ID="btnDelete" CommandName="delete"
                                                            class="btn btn-sm btn-primary" runat="server" Text='Delete'
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
                        </div>
                        <div class="card-footer">
                            <center>
                                <asp:DataPager id="dpWorkouts" runat="server" pageSize="3" PagedControlID="lvWorkout">
                                    <Fields>
                                        <asp:NumericPagerField Buttontype="Button"
                                                               NumericButtonCssClass="btn btn-default"
                                                               CurrentPageLabelCssClass="btn btn-success"
                                                               NextPreviousButtonCssClass ="btn btn-default" 
                                                               ButtonCount="10" />
                                    </Fields>
                                </asp:DataPager>
                            </center>
                            <div class="pull-left">
                                <div class="row form-group">
                                    <div class="col col-md-4">
                                        <label class="form-control-label">Session #</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtSession" class="form-control"
                                                     TextMode="Number" runat="server" />
                                        <div id="pnlSession" runat="server" visible="false">
                                            <div class="alert alert-danger">
                                                <b>Enter session number</b>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col col-md-2">
                                        <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="Save Workout" 
                                                    OnClientClick='return confirm("Are you sure?");' OnClick="btnSubmit_OnClick" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div id="details" class="modal fade">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="pull-left">
                            <h4 class="modal-title">Workout Session Details</h4>
                        </div>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="card-body">
                                    <div class="card">
                                        <div class="card-header">
                                            Workout Details
                                        </div>
                                        <div class="card-body">
                                            <div class="table-responsive">
                                                <table class="table table-striped table-hover">
                                                    <thead>
                                                        <th>Body Part</th>
                                                        <th>Workout Name</th>
                                                        <th>Weight</th>
                                                        <th>Repetitions</th>
                                                        <th>Sets</th>
                                                        <th>Date Added</th>
                                                    </thead>
                                                    <tbody>
                                                        <asp:ListView ID="lvWDModal" runat="server"
                                                            OnPagePropertiesChanging="lvWDModal_OnPagePropertiesChanging"
                                                            OnDataBound="lvWDModal_OnDataBound">
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td><%# Eval("BodyPart") %></td>
                                                                    <td><%# Eval("WorkoutName") %></td>
                                                                    <td><%# Eval("Weight") %> kg</td>
                                                                    <td><%# Eval("Repetitions") %></td>
                                                                    <td><%# Eval("Sets") %></td>
                                                                    <td><%# Eval("DateAdded", "{0: MMMM d, yyyy}") %></td>
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
                                                <asp:DataPager id="dpWDModal" runat="server" pageSize="10" PagedControlID="lvWDModal">
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
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

