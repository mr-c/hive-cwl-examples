#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: The HIVE Hexagon Sequence aligner
doc: |
  Mock description of the HIVE Hexagon sequence aligner, based upon published
  information

requirements:
  InlineJavascriptRequirement: []
hints:
  SoftwareRequirement:
   packages:
     - package: hive-hexagon
       version: 1.3
       specs: [ http://doi.org/10.1371/journal.pone.0099033 ]

inputs:
 seed:
   type: int
   default: 11
   inputBinding:
     valueFrom: |
     ${ if (self < 8 || self > 12) {
          throw false;
        } else {
          return self;
        } }
 minimum_match_length:
   type: int
   inputBinding: []
 divergence_threshold_percent:
   type: int
   inputBinding:
     valueFrom: |
     ${ if (self < 10 || self > 40) {
          throw false;
        } else {
          return self;
        } }
 shortreads:
   type: File[]
   format: edam:format_1929  # FASTA
   inputBinding: []
 reference_genomes:
   type: File[]
   format: edam:format_1929  # FASTA
   inputBinding: []

basecommand: hive-hexagon  # not tested, no source code?

outputs:
 alignments: File
 format: edam:format_2573  # SAM sequence alignment
 outputBinding: [ glob: '*' ]

$namespaces:
  edam: http://edamontology.org/
$schemas: [ http://edamontology.org/EDAM_1.16.owl ]
