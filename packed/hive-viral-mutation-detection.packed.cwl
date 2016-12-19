{
    "cwlVersion": "v1.0", 
    "$graph": [
        {
            "class": "CommandLineTool", 
            "label": "The HIVE Heptagon variant caller", 
            "doc": "Mock description of the HIVE Hexagon variant caller, based upon public\ninformation\n", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "packages": [
                        {
                            "package": "hive-heptagon", 
                            "version": [
                                "1.1"
                            ]
                        }
                    ], 
                    "class": "SoftwareRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "File", 
                    "format": "http://edamontology.org/format_2573", 
                    "inputBinding": {}, 
                    "id": "#hive-heptagon.cwl/alignments"
                }, 
                {
                    "type": "float", 
                    "default": 0.1, 
                    "inputBinding": {
                        "valueFrom": "${ if (self < 0 || self > 1.0) {\n     throw false;\n   } else {\n     return self;\n   }\n }\n"
                    }, 
                    "id": "#hive-heptagon.cwl/freq_cutoff"
                }, 
                {
                    "type": "int", 
                    "default": 10, 
                    "inputBinding": {
                        "valueFrom": "${ if (self < 0) {\n     throw false;\n   } else {\n     return self;\n   }\n }\n"
                    }, 
                    "id": "#hive-heptagon.cwl/min_coverage"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "format": "http://edamontology.org/format_1929", 
                    "inputBinding": {}, 
                    "id": "#hive-heptagon.cwl/reference_genomes"
                }
            ], 
            "baseCommand": "hive-heptagon", 
            "outputs": [
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "AAcalls.csv"
                    }, 
                    "format": "http://www.iana.org/assignments/media-typestext/csv", 
                    "id": "#hive-heptagon.cwl/aminoacid_calls"
                }, 
                {
                    "type": "File", 
                    "outputBinding": {
                        "glob": "SNPProfile*"
                    }, 
                    "id": "#hive-heptagon.cwl/snv_profile"
                }
            ], 
            "$namespaces": {
                "edam": "http://edamontology.org/", 
                "iana_media": "http://www.iana.org/assignments/media-types"
            }, 
            "$schemas": [
                "http://edamontology.org/EDAM_1.16.owl"
            ], 
            "id": "#hive-heptagon.cwl"
        }, 
        {
            "class": "CommandLineTool", 
            "label": "The HIVE Hexagon Sequence aligner", 
            "doc": "Mock description of the HIVE Hexagon sequence aligner, based upon published\ninformation\n", 
            "requirements": [
                {
                    "class": "InlineJavascriptRequirement"
                }
            ], 
            "hints": [
                {
                    "packages": [
                        {
                            "package": "hive-hexagon", 
                            "version": [
                                "1.3"
                            ], 
                            "specs": [
                                "http://doi.org/10.1371/journal.pone.0099033"
                            ]
                        }
                    ], 
                    "class": "SoftwareRequirement"
                }
            ], 
            "inputs": [
                {
                    "type": "int", 
                    "inputBinding": {
                        "valueFrom": "${ if (self < 10 || self > 40) {\n     throw false;\n   } else {\n     return self;\n   }\n }\n"
                    }, 
                    "id": "#hive-hexagon.cwl/divergence_threshold_percent"
                }, 
                {
                    "type": "int", 
                    "inputBinding": {}, 
                    "id": "#hive-hexagon.cwl/minimum_match_length"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "format": "http://edamontology.org/format_1929", 
                    "inputBinding": {}, 
                    "id": "#hive-hexagon.cwl/reference_genomes"
                }, 
                {
                    "type": "int", 
                    "default": 11, 
                    "inputBinding": {
                        "valueFrom": "${ if (self < 8 || self > 12) {\n     throw false;\n   } else {\n     return self;\n   }\n }\n"
                    }, 
                    "id": "#hive-hexagon.cwl/seed"
                }, 
                {
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "format": "http://edamontology.org/format_1929", 
                    "inputBinding": {}, 
                    "id": "#hive-hexagon.cwl/shortreads"
                }
            ], 
            "baseCommand": "hive-hexagon", 
            "outputs": [
                {
                    "type": "File", 
                    "format": "http://edamontology.org/format_2573", 
                    "outputBinding": {
                        "glob": "*"
                    }, 
                    "id": "#hive-hexagon.cwl/alignments"
                }
            ], 
            "$namespaces": {
                "edam": "http://edamontology.org/"
            }, 
            "$schemas": [
                "http://edamontology.org/EDAM_1.16.owl"
            ], 
            "id": "#hive-hexagon.cwl"
        }, 
        {
            "class": "Workflow", 
            "label": "The HIVE Viral Mutation Detection Pipeline", 
            "doc": "Mock description of the HIVE Viral Mutation Detection Pipeline, based upon\npublic information\n", 
            "inputs": [
                {
                    "type": "float", 
                    "default": 15, 
                    "id": "#main/alignment_divergence_threshold_percent"
                }, 
                {
                    "type": "int", 
                    "default": 75, 
                    "id": "#main/alignment_minimum_match_len"
                }, 
                {
                    "type": "int", 
                    "default": 16, 
                    "id": "#main/alignment_seed"
                }, 
                {
                    "label": "Reference Sequences", 
                    "doc": "reference sequences are FASTA from known sources\n", 
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "format": "http://edamontology.org/format_1929", 
                    "id": "#main/reference_sequence"
                }, 
                {
                    "label": "Nucleotide Read", 
                    "doc": "sequences are FASTA from experimental sources", 
                    "type": {
                        "type": "array", 
                        "items": "File"
                    }, 
                    "format": "http://edamontology.org/format_1929", 
                    "id": "#main/sequence_reads"
                }, 
                {
                    "type": "float", 
                    "default": 0.1, 
                    "id": "#main/variant_calling_frequency_cutoff"
                }, 
                {
                    "type": "int", 
                    "default": 10, 
                    "id": "#main/variant_calling_minimum_coverage"
                }
            ], 
            "steps": [
                {
                    "run": "#hive-hexagon.cwl", 
                    "in": [
                        {
                            "source": "#main/alignment_divergence_threshold_percent", 
                            "id": "#main/alignment/divergence_threshold_percent"
                        }, 
                        {
                            "source": "#main/alignment_minimum_match_len", 
                            "id": "#main/alignment/minimum_match_length"
                        }, 
                        {
                            "source": "#main/reference_sequence", 
                            "id": "#main/alignment/reference_genomes"
                        }, 
                        {
                            "source": "#main/alignment_seed", 
                            "id": "#main/alignment/seed"
                        }, 
                        {
                            "source": "#main/sequence_reads", 
                            "id": "#main/alignment/shortreads"
                        }
                    ], 
                    "out": [
                        "#main/alignment/alignments"
                    ], 
                    "id": "#main/alignment"
                }, 
                {
                    "run": "#hive-heptagon.cwl", 
                    "in": [
                        {
                            "source": "#main/alignment/alignments", 
                            "id": "#main/variant_calling/alignments"
                        }, 
                        {
                            "source": "#main/variant_calling_frequency_cutoff", 
                            "id": "#main/variant_calling/frequency_cutoff"
                        }, 
                        {
                            "source": "#main/variant_calling_minimum_coverage", 
                            "id": "#main/variant_calling/minimum_coverage"
                        }, 
                        {
                            "source": "#main/reference_sequence", 
                            "id": "#main/variant_calling/reference_genomes"
                        }
                    ], 
                    "out": [
                        "#main/variant_calling/snv_profile", 
                        "#main/variant_calling/aminoacid_calls"
                    ], 
                    "id": "#main/variant_calling"
                }
            ], 
            "outputs": [
                {
                    "label": "Alignment File", 
                    "doc": "The resulting alignment file from the Hexagon computation", 
                    "type": "File", 
                    "outputSource": "#main/alignment/alignments", 
                    "format": "http://edamontology.org/format_2573", 
                    "id": "#main/alignment_file"
                }, 
                {
                    "label": "Amino Acid Calls", 
                    "doc": "the amino acid calls from Heptagon", 
                    "type": "File", 
                    "outputSource": "#main/variant_calling/aminoacid_calls", 
                    "format": "http://www.iana.org/assignments/media-typestext/csv", 
                    "id": "#main/aminoacid_calls"
                }, 
                {
                    "label": "SNPProfile Output File", 
                    "doc": "The output file containing the SNP Profile", 
                    "type": "File", 
                    "outputSource": "#main/variant_calling/snv_profile", 
                    "id": "#main/snv_profile"
                }
            ], 
            "$namespaces": {
                "edam": "http://edamontology.org/", 
                "iana_media": "http://www.iana.org/assignments/media-types"
            }, 
            "$schemas": [
                "http://edamontology.org/EDAM_1.16.owl"
            ], 
            "id": "#main"
        }
    ]
}