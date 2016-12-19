#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
label: The HIVE Heptagon variant caller
doc: |
  Mock description of the HIVE Hexagon variant caller, based upon public
  information

requirements:
  InlineJavascriptRequirement: {}
hints:
  SoftwareRequirement:
   packages:
     - package: hive-heptagon
       version: [ "1.1" ]
       # specs: []

inputs:
 min_coverage:
   type: int
   default: 10
   inputBinding:
     valueFrom: |
       ${ if (self < 0) {
            throw false;
          } else {
            return self;
          }
        }
 freq_cutoff:
   type: float
   default: 0.10
   inputBinding:
     valueFrom: |
       ${ if (self < 0 || self > 1.0) {
            throw false;
          } else {
            return self;
          }
        }
 alignments:
   type: File
   format: edam:format_2573  # SAM sequence alignment
   inputBinding: {}
 reference_genomes:
   type: File[]
   format: edam:format_1929  # FASTA
   inputBinding: {}

baseCommand: hive-heptagon  # not tested, no source code?

outputs:
 snv_profile:
   type: File
   outputBinding: { glob: 'SNPProfile*' }
   #format: ???
 aminoacid_calls:
   type: File
   outputBinding: { glob: AAcalls.csv }
   format: iana_media:text/csv

$namespaces:
  edam: http://edamontology.org/
  iana_media: http://www.iana.org/assignments/media-types
$schemas:
 - http://edamontology.org/EDAM_1.16.owl
