## Learning AL Development

### Report Triggers

- OnInitReport: Report is Initialized
  This is run before the request page trigger, it is run before any processing is done for the data item

- OnPreReport:
  After the request page, we go to the OnPreReport trigger, this runs before the report start execution.
  On the OnPreReport trigger, we process the items (Any values entered) on the request page, this will be processed on the PreReport.
  At the time you are running the OnPreReport, there is no data that is being processed

- OnPostReport:
  This get called at the end of the report

### Data Item Triggers

- PreDataItem:
  This is called before that data item actually start executing

- AfterGetRecords:
  This is called when every record of that particular data item is fetched

- PostDataItems:
  This is called at the end of that data item

  ## Data items and columns

  Data item is a table in Business Central. A report can have 0 to n Data Items.
  Data Items can be placed hieraticaly by using Indentation.

  Data Item is a collection of columns. A column can be - Table Field, variable, expression, caption.

## Labels

Used to add text field to the parameters. Used for - Captions and Fix Text.
Labels can be added to Data Items.

- Benefits:
  - Translation file - multilingual.
  - Fix Text Labels - available as parameter in layout.
  - Improve performance.

## Request Page

After the OnInitReport trigger is ran, the system generate the request page. In the request page, we can add our filters and other processings.

- The request page collects requests and options from users before execution.
- Request pages enable users to specify options and filters for a report.

## Layout

- Client report definition (RDLC) layouts
  Require

1. Visual Studio Report Design or
2. Microsoft SQL Server Reporting Services Report Builder
