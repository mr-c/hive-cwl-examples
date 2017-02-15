#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow
label: The HIVE Viral Mutation Detection Pipeline
schema:version: 1.2
doc: |
  Mock description of the HIVE Viral Mutation Detection Pipeline, based upon
  public information

schema:author:
  class: schema:Person
  schema:name: Charles Darwin
  schema:sameAs:
   - id: http://www.isni.org/isni/0000000121251077
schema:author:
  class: schema:Person
  schema:name: Rosalind Franklin
  schema:sameAs:
   - id: http://www.isni.org/isni/0000000066799514

inputs:
 reference_sequence:
   label: Reference Sequences
   doc: |
     reference sequences are FASTA from known sources
   type: File[]
   format: edam:format_1929  # FASTA
 sequence_reads:
   label: Nucleotide Read
   doc: sequences are FASTA from experimental sources
   type: File[]
   format: edam:format_1929  # FASTA
 alignment_seed:
   type: int
   default: 16
 alignment_minimum_match_len:
   type: int
   default: 75
 alignment_divergence_threshold_percent:
   type: float
   default: 15
 variant_calling_minimum_coverage:
   type: int
   default: 10
 variant_calling_frequency_cutoff:
   type: float
   default: 0.10

steps:
  alignment:
    run: hive-hexagon.cwl
    in:
      reference_genomes: reference_sequence
      shortreads: sequence_reads
      seed: alignment_seed
      minimum_match_length: alignment_minimum_match_len
      divergence_threshold_percent: alignment_divergence_threshold_percent
    out: [alignments]
  variant_calling:
    run: hive-heptagon.cwl
    in:
      reference_genomes: reference_sequence
      alignments: alignment/alignments
      minimum_coverage: variant_calling_minimum_coverage
      frequency_cutoff: variant_calling_frequency_cutoff
    out: [snv_profile, aminoacid_calls]

outputs:
 snv_profile:
   label: SNPProfile Output File
   doc: The output file containing the SNP Profile
   type: File
   outputSource: variant_calling/snv_profile
   # format: ???
 alignment_file:
   label: Alignment File
   doc: The resulting alignment file from the Hexagon computation
   type: File
   outputSource: alignment/alignments
   format: edam:format_2573  # SAM sequence alignment
 aminoacid_calls:
   label: Amino Acid Calls
   doc: the amino acid calls from Heptagon
   type: File
   outputSource: variant_calling/aminoacid_calls
   format: iana_media:text/csv

$namespaces:
  edam: http://edamontology.org/
  iana_media: http://www.iana.org/assignments/media-types
  schema: http://schema.org/
$schemas: 
  - http://edamontology.org/EDAM_1.16.owl
  - http://schema.org/docs/schema_org_rdfa.html
