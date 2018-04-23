<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ClientSummary.aspx.cs" Inherits="Users_ClientSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Client Summary

    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <form class="form-horizontal" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <strong>Client Details</strong>
                        </div>
                        <div class="card-body card-block">
                            <div class="col-lg-6">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Client Photo</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <div class="thumbnail" id="usrPic">
                                            <asp:HyperLink ID="imgUserLb" runat="server" data-lightbox="lbDB">
                                                <asp:Image ID="imgUser" class="img-responsive" Width="200" runat="server" />
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">First Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtFN" class="form-control"
                                            Placeholder="First Name" runat="server" disabled />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Last Name</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtLN" class="form-control"
                                            Placeholder="Last Name" runat="server" disabled />
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Date of Birth</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <div class="input-group">
                                            <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                            <asp:TextBox ID="txtBday" class="form-control"
                                                TextMode="Date" runat="server" disabled />
                                        </div>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Email Address</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:TextBox ID="txtEmail" class="form-control"
                                            Placeholder="Email Address" runat="server" disabled />
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
                                                Placeholder="Mobile No."
                                                TextMode="Number" runat="server" disabled />
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
                                            Style="max-width: 100%;" disabled />
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3">
                                        <label class="form-control-label">Status</label>
                                    </div>
                                    <div class="col-12 col-md-9">
                                        <asp:DropDownList ID="ddlStatus" class="form-control"
                                            runat="server" disabled>
                                            <asp:ListItem>Active</asp:ListItem>
                                            <asp:ListItem>Inactive</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Coaching Record
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
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
                                                        <a href='<%# string.Concat("../clientprogress/", Eval("ProgressPicFront")) %>' data-lightbox="image-1">
                                                            <img id="Img1" runat="server" src='<%# string.Concat("~/clientprogress/", Eval("ProgressPicFront")) %>'
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
                                                            class="btn btn-sm btn-primary" runat="server" Text='Coaching Details'
                                                            OnSubmitBehavior="false"
                                                            formnovalidate />
                                                        <asp:Button ID="btnRemoveRec" CommandName="delrec"
                                                            class="btn btn-sm btn-danger" runat="server" Text='Delete Record'
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
                                <asp:DataPager id="dpCoachHist" runat="server" pageSize="3" PagedControlID="lvCoaching">
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
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            Client Body Composition Log
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-hover">
                                    <thead>
                                        <th>Date Added</th>
                                        <th>Weight</th>
                                        <th>Fat Percentage</th>
                                        <th>Fat Mass</th>
                                        <th>Muscle Mass</th>
                                        <th></th>
                                    </thead>
                                    <tbody>
                                        <asp:ListView ID="lvBodyComp" runat="server"
                                            OnPagePropertiesChanging="lvBodyComp_OnPagePropertiesChanging"
                                            OnDataBound="lvBodyComp_OnDataBound"
                                            OnItemCommand="lvBodyComp_OnItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("DateAdded", "{0: MMMM d, yyyy}") %></td>
                                                    <td><%# Eval("Weight") %> kg</td>
                                                    <td><%# Eval("FatPer") %> %</td>
                                                    <td><%# Eval("FatMass") %> kg</td>
                                                    <td><%# Eval("MuscleMass") %> kg</td>
                                                    <asp:Literal ID="ltBCID" runat="server" Text='<%# Eval("BCID") %>' Visible="false" />
                                                    <td>
                                                        <asp:Button ID="btnBodyComp" CommandName="details"
                                                            class="btn btn-sm btn-primary" runat="server" Text='Body Comp Details'
                                                            OnSubmitBehavior="false"
                                                            formnovalidate />
                                                        <asp:Button ID="btnDelRecord" CommandName="delitem"
                                                                    class="btn btn-sm btn-danger" runat="server" Text='Delete Record'
                                                                    OnSubmitBehavior="false" OnClientClick='return confirm("Are you sure?");'
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
                                <asp:DataPager id="dpBodyComp" runat="server" pageSize="3" PagedControlID="lvBodyComp">
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
                                                        <asp:Button ID="btnWorkoutD" CommandName="workdetails"
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

                <div id="details" class="modal fade">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="pull-left">
                                    <h4 class="modal-title">Body Composition Details</h4>
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="col-lg-6">
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Body Type</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtBType2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Gender</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtGender2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Age</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtAge2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Height (cm)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtHght2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Weight (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtWght2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Clothes Weight (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtCWght2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Fat %</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtFatPer2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Fat Mass (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtFatMass2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">FFM (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtFFM2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Muscle Mass (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtMMass2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">TBW (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtTBW2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">TBW %</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtTBWPer2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Bone Mass (kg)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtBMass2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">BMR (kj)</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtBMR2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Metabolic Age</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtMAge2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">VFR</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtVFR2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">BMI</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtBMI2" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="coachingDetails" class="modal fade">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="pull-left">
                                    <h4 class="modal-title">Coaching Details</h4>
                                </div>
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            </div>
                            <div class="modal-body">
                                <asp:UpdatePanel runat="server">
                                    <ContentTemplate>
                                        <div class="card-body">
                                            <div class="col-lg-6">
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Front Photo</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <div class="thumbnail" id="idFront">
                                                            <asp:HyperLink ID="lnkFront" runat="server" data-lightbox="lbDB">
                                                                <asp:Image ID="imgFront" class="img-responsive" Width="200" runat="server" />
                                                            </asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Side Photo</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <div class="thumbnail" id="idSide">
                                                            <asp:HyperLink ID="lnkSide" runat="server" data-lightbox="lbDB">
                                                                <asp:Image ID="imgSide" class="img-responsive" Width="200" runat="server" />
                                                            </asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Back Photo</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <div class="thumbnail" id="idBack">
                                                            <asp:HyperLink ID="lnkBack" runat="server" data-lightbox="lbDB">
                                                                <asp:Image ID="imgBack" class="img-responsive" Width="200" runat="server" />
                                                            </asp:HyperLink>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-lg-6">
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Age</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="TextBox1" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Weight</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="TextBox2" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Height</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="TextBox3" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Arms</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtArms2" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Chest</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtChst2" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Waist</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtWst2" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Hip</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtHip2" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <%--                                        <div class="row form-group">
                                            <div class="col col-md-3">
                                                <label class="form-control-label">Thigh</label>
                                            </div>
                                            <div class="col-12 col-md-9">
                                                <asp:TextBox ID="txtThgh2" class="form-control"
                                                    runat="server" disabled />
                                            </div>
                                        </div>--%>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Legs</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtLgs2" class="form-control"
                                                            runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Fitness Goal</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtGoal" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Coaching Package</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtPackage" class="form-control" runat="server" disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Coaching Fee</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtCoachFee2" class="form-control"
                                                            disabled runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Time of Record</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:TextBox ID="txtTOR" class="form-control" runat="server"
                                                            disabled />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-6">
                                                        <b>
                                                            <label class="form-control-label">Training Schedule</label></b>
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Mon</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:CheckBox ID="chkMon2" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Tue</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:CheckBox ID="chkTue2" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Wed</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:CheckBox ID="chkWed2" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Thur</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:CheckBox ID="chkThu2" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Fri</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:CheckBox ID="chkFri2" runat="server" />
                                                    </div>
                                                </div>
                                                <div class="row form-group">
                                                    <div class="col col-md-3">
                                                        <label class="form-control-label">Sat</label>
                                                    </div>
                                                    <div class="col-12 col-md-9">
                                                        <asp:CheckBox ID="chkSat2" runat="server" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="workdetails" class="modal fade">
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</asp:Content>

