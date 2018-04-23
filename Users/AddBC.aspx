<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="AddBC.aspx.cs" Inherits="Users_AddBC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Add Client Training
    
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery.min.js") %>'></script>
    <script type='text/javascript' src='<%= Page.ResolveUrl("~/js/newjs/jquery-ui.min.js") %>'></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

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
                        url: "AddBC.aspx/GetName",
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
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <form class="form-horizontal" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
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
                            <div id="pnlClientError" runat="server" visible="false">
                                <div class="alert alert-danger">
                                    <b>Select a client</b>
                                </div>
                            </div>
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
                <div class="card">
                    <div class="card-header">
                        Body Composition Details
                        <div class="pull-right">
                            <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" Text="Add" OnClick="btnSubmit_OnClick" />
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="col-lg-6">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Body Type</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtBType" class="form-control"
                                                 Placeholder="Body Type"
                                                 runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Gender</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:DropDownList ID="ddlGender" class="form-control" runat="server">
                                        <asp:ListItem>Male</asp:ListItem>
                                        <asp:ListItem>Female</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Age</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtAge" class="form-control"
                                                 Placeholder="Age"
                                                 TextMode="Number" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Height (cm)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtHght" class="form-control"
                                                 Placeholder="Height"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Weight (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtWght" class="form-control"
                                                 Placeholder="Weight"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Clothes Weight (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtCWght" class="form-control"
                                                 Placeholder="Clothes Weight"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Fat %</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtFatPer" class="form-control"
                                                 Placeholder="Fat Percentage"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Fat Mass (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtFMass" class="form-control"
                                                 Placeholder="Fat Mass"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">FFM (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtFFM" class="form-control"
                                                 Placeholder="FFM"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Muscle Mass (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtMMass" class="form-control"
                                                 Placeholder="Muscle Mass"
                                                 TextMode="Number" 
                                                 step="any" runat="server" />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">TBW (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtTBW" class="form-control"
                                                 Placeholder="Total Body Weight"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">TBW %</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtTBWPer" class="form-control"
                                                 Placeholder="TBW Percentage"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Bone Mass (kg)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtBMass" class="form-control"
                                                 Placeholder="Bone Mass"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">BMR (kj)</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtBMR" class="form-control"
                                                 Placeholder="Basal Metabolic Rate"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">Metabolic Age</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtMAge" class="form-control"
                                                 Placeholder="Metabolic Age"
                                                 TextMode="Number"
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">VFR</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtVFR" class="form-control"
                                                 Placeholder="Viceral Fat Rating"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
                                </div>
                            </div>
                            <div class="row form-group">
                                <div class="col col-md-3">
                                    <label class="form-control-label">BMI</label>
                                </div>
                                <div class="col-12 col-md-9">
                                    <asp:TextBox ID="txtBMI" class="form-control"
                                                 Placeholder="Body Mass Index"
                                                 TextMode="Number" 
                                                 step="any" runat="server"  />
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
    </form>
</asp:Content>

