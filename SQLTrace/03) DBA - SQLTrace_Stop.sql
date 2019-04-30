DECLARE @TraceID int;

SELECT @TraceID = traceid
FROM ::fn_trace_getinfo(0)
WHERE property = 2 AND CAST(value as varchar(256)) like 'W:\DBA\SQLTrace\TUL1MDPDWMSH3C1_%';

IF @TraceID IS NOT NULL
BEGIN
	EXEC sp_trace_setstatus @TraceID, 0;
	EXEC sp_trace_setstatus @TraceID, 2;
END
ELSE
	PRINT ' SQL Trace not running';