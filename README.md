Manual translation of
https://hive.biochemistry.gwu.edu/cgi-bin/prd/htscsrs//servlet.cgi?pageid=bcoexample_1
into CWL

Notes:
 Not tested due to lack of source code

Things not translated, but could be added without breaking CWL compatibility
 - usability_domain, could go in documentation or as a HIVE/biocompute specific
   extension 
 - xref
 - keywords
 - publication_status
 - modification_date, creation_date
 - "verification"
 - that this is a subtype of the "antiviral_resistance_detection[ICD:B17]",
   could have been done via a Workflow that contains the other Workflow and
sets different defaults.
 

Questions about biocompute: what's the relationship between "pipeline" and the
"type" field in the biocompute object?

How does BioCompute model the flow of data between steps? (Or is that implicit
in the "script": "obj.123123"?)

What is the priority for defaults amongst the antiviral_resistance_detection typedef,
the biocompute object itself, and the referenced pipeline?

What is the meaning of the verfication_kit?
