#AL PROJECT

## Learning AL Development

### Report Triggers

- Triggers
  InitReport: Report is Initialized

- PreReport:
  This runs before the report start execution
- PostReport:
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

- The request page collects requests and options from users before execution.
- Request pages enable users to specify options and filters for a report.

## Layout

- Client report definition (RDLC) layouts
  Require

1. Visual Studio Report Design or
2. Microsoft SQL Server Reporting Services Report Builder
