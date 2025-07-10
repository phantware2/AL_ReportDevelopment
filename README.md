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
