report 50300 LABCustomerList
{
    Caption = 'LAB Customer List';
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    PreviewMode = Normal;
    DefaultRenderingLayout = Example_EXCELLayout;

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance__LCY_; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
        }
    }

    rendering
    {

        layout(Example_RDLCLayout)
        {
            Type = RDLC;
            LayoutFile = './src/MB-820-Exercise/Reports/layouts/LABCustomerList.rdl';
            Caption = 'LAB Customer List RDLC Layout';
            Summary = 'This is the RDLC layout for the LAB Customer List report.';
        }
        layout(Example_WORDLayout)
        {
            Type = Word;
            LayoutFile = './src/MB-820-Exercise/Reports/layouts/LABCustomerList.docx';
            Caption = 'LAB Customer List Word Layout';
            Summary = 'This is the Word layout for the LAB Customer List report.';
        }
        layout(Example_EXCELLayout)
        {
            Type = Excel;
            LayoutFile = './src/MB-820-Exercise/Reports/layouts/LABCustomerList.xlsx';
            Caption = 'LAB Customer List Excel Layout';
            Summary = 'This is the Excel layout for the LAB Customer List report.';
        }
    }

    var
        myInt: Integer;
}