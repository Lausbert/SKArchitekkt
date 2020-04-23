//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct CocoaPodsWorkspace: Ressource {

    static let jsonString: String = """
{
  "arcs" : [

  ],
  "children" : [
    {
      "arcs" : [

      ],
      "children" : [
        {
          "arcs" : [

          ],
          "children" : [
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "4F182285-0686-4945-B45E-1F1F776A5A8B",
              "scope" : "import_decl",
              "tags" : [
                "Foundation"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "03D6B5E0-D077-4B19-AD5B-4299565908CE",
                      "name" : "TestClass.init().self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "1D82A1FE-5CB2-4F05-83D8-B48C319FBEA5",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "04982EFE-EF8E-4982-9D8D-C90AADD52477",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "A9DE1C9D-59DD-4868-99F2-312A3F68F9EB",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "B6807544-76FA-4B3C-8E94-C304D47DD914",
                  "name" : "TestClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "7620BE62-FCF3-4E6F-943A-9231A90AB854",
                      "name" : "TestClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "C1D13420-0B0B-475E-99DC-6C15A679B803",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "17A16600-5D93-4025-981B-7702803C3BCA",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "EF48148C-858C-48A2-86DB-173A25DB223B",
                  "name" : "TestClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "23A48618-0271-4951-81B4-E8BAEEF129AB",
              "name" : "TestClass",
              "scope" : "class_decl",
              "tags" : [
                "access=open",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "7A342165-C35C-46E2-8A86-97D4576D1DE3",
                      "name" : "TestStruct.init().self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "043C1AF7-29D2-4583-B2CF-32AF98040B05",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "6D98B6E9-625F-497D-B024-8A50A13E0017",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "415D34A9-7814-4F5A-BED4-C6383F052472",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "9A658FA5-8D6B-4DE2-AE90-128599688EC7",
                  "name" : "TestStruct.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                }
              ],
              "id" : "7CECF17E-3CC2-41B5-B760-9DBA9A32F558",
              "name" : "TestStruct",
              "scope" : "struct_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "2F42A42E-C0F7-404E-B83B-60E280B73DEA",
              "name" : "TestProtocol",
              "scope" : "protocol",
              "tags" : [
                "Self : TestProtocol",
                "access=public",
                "interface",
                "non-resilient",
                "requirement",
                "signature=<Self>"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "A83F5DA6-FDC7-4701-A518-6C3B4C9D5016",
                      "name" : "TestGenericClass.init().self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "8516A56F-8B7F-4A64-97C8-578DD8DEA526",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "4409ACFE-9ED0-4034-9330-B2A76959D47E",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "A6251F2F-2CDA-4385-A8B0-2A5A4BD9139F",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "9B5E2D93-A9F1-43B9-8034-93471EBCDA26",
                  "name" : "TestGenericClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "04C41581-77BE-417F-BD63-38290B28CDCF",
                      "name" : "TestGenericClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "A1C40BA4-E959-409C-BB05-DB76C9FDDBAC",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "F2733323-8BD9-45CB-92CD-389422525CC5",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "B299799A-8AEF-492B-8295-C7BB0CD57E3E",
                  "name" : "TestGenericClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7",
              "name" : "TestGenericClass",
              "scope" : "class_decl",
              "tags" : [
                "T",
                "access=open",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "AFC175F8-8ED2-4EBA-B706-A37080485E90",
                      "name" : "TestEnum.test:86A58873-AB3F-45F1-BA33-07BAFB530914",
                      "scope" : "enum_element_decl",
                      "tags" : [
                        "access=public",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "23992E50-2C6F-4188-A2D7-CB0D5BB341FB",
                  "scope" : "enum_case_decl",
                  "tags" : [

                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [

                  ],
                  "id" : "0F4E5AD3-7C6A-4E28-9FCA-3F671B607AAD",
                  "name" : "TestEnum.test:481B4F0C-7C65-4C71-9EA2-008C07A92D61",
                  "scope" : "enum_element_decl",
                  "tags" : [
                    "access=public",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "4D70FEE4-C028-4C21-857D-956FAD372E6D",
                      "name" : "TestEnum.__derived_enum_equals(_:_:).self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "B60CFC73-345C-4398-8C91-955DB9D19EA2",
                          "name" : "TestEnum.__derived_enum_equals(_:_:).a",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "430DAC3E-6603-4DEA-80A6-5D917DEE04A1",
                          "name" : "TestEnum.__derived_enum_equals(_:_:).b",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "3A1B56AF-F71F-4EE6-A387-C67F8628A917",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "0668C8BF-9396-4A2B-9262-49C0C8E9F4FF",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_a"
                                  ]
                                }
                              ],
                              "id" : "0964CB27-3397-4FAD-BBF7-C2A2F453773E",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "5CF9D83F-E5F2-44A3-BD00-8197C96A95B6",
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "411FA157-B526-4C72-9200-F6D1E0BF9068",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "4007D1EB-E395-4880-A878-5EC621645C76",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "045AE4BF-47F3-4504-BA37-86886D7BA0FC",
                                  "scope" : "case_label_item",
                                  "tags" : [

                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "C87BB5BB-5B3A-47E2-BA87-9ED8D1D4EA93",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "8DE6E58B-B661-4CD9-8A42-1BAF00B83E71",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "4952BC88-2ECB-4BFC-858B-E6D4186D3316",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "D8ABBB02-5119-4980-8197-AC273C693E35",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "05841A13-9947-4C8F-A390-2F919DC12951",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "6EE1A4CB-B41B-40F1-9F33-4EF03E5A482B",
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "293E8A99-EEB1-4DF0-A5D0-FBE0B34D73F7",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_b"
                                  ]
                                }
                              ],
                              "id" : "C77014CF-BA60-4E4D-BAF5-F842CE60EA2F",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "DC208996-910D-4037-BF3D-0A46604DF086",
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "8FA187CF-1BD9-46F0-9988-5F9B19427306",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "2FD710BF-9CF4-4AFB-9FD4-78EA94ED15AA",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "57EB767E-E66E-493B-8E3B-5D963D7D8BA1",
                                  "scope" : "case_label_item",
                                  "tags" : [

                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "17911DAB-4A7B-45E2-AA4E-7CA89AD4C85F",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "BDF9BCDD-7BF3-405A-850C-AAC5CD33BFD2",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "B129B2B2-A406-4940-B1B5-536B3C8BFC58",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "23E04D47-11CD-4FD3-887D-68BB0E9D4565",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "532F12B3-D7B9-41C6-A6F8-D8755C4B6289",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "E3099DBE-34BB-4C7F-BFE4-B5524F9AFED7",
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "21D647F0-A2B3-4D6B-B401-454794774753",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "42401511-8B2E-4D68-A1E3-915E1BB2311A",
                                      "scope" : "type_expr",
                                      "tags" : [
                                        "<<NULL>>",
                                        "implicit",
                                        "typerepr="
                                      ]
                                    }
                                  ],
                                  "id" : "D57F5BBF-402F-4222-B2DC-0162A468D6F8",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "B2F50EA8-F733-4C61-ADDE-5DBF15C9EEF1",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "F9343260-50BA-4211-913D-A035088392F4",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "7BB452CA-39F3-41E7-AC9E-A6F67FCCEA19",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "15872699-7BAE-4B0C-9262-72A1784A570B",
                              "scope" : "binary_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "860B0DB7-C216-46A1-8F5F-A76AD3570F1C",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "36AC97F1-7885-42C7-B328-99E56C374B51",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "7E5EEEC2-6A14-4986-A9A6-C9ADFBFCA10E",
                  "name" : "TestEnum.__derived_enum_equals(_:_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface",
                    "type"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "A972A101-0F17-4784-9384-9010B707DA28",
                          "name" : "TestEnum.hashValue.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "DC619CF7-7428-4D85-9AD5-AC295E52E408",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "15460F60-50E0-4C52-8640-B0A74478B9AB",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "8E4F5802-0D11-4D75-98BB-EE224ABF7334",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "id" : "6DAC89F2-E4E3-488B-AD45-B9786245A371",
                                      "scope" : "tuple_expr",
                                      "tags" : [
                                        "implicit",
                                        "names=for"
                                      ]
                                    }
                                  ],
                                  "id" : "E4E4AD9D-D6E1-4B6C-AC48-629E39D271B5",
                                  "scope" : "call_expr",
                                  "tags" : [
                                    "arg_labels=for:",
                                    "implicit",
                                    "nothrow"
                                  ]
                                }
                              ],
                              "id" : "B0540752-35A5-41D5-83A8-74F71207730F",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "A55B1360-DA6F-4385-9176-00696FA0FDA1",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "C6A0FF85-3616-4BF1-9C7B-EE0967244891",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=public",
                        "get_for=hashValue",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "625C196A-F6F1-4610-A21B-187E73D60F12",
                  "name" : "TestEnum.hashValue",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=public",
                    "immutable",
                    "implicit",
                    "interface",
                    "readImpl=getter"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "07097232-EB20-4261-8DFE-50003F5DF685",
                          "scope" : "pattern_named",
                          "tags" : [
                            "hashValue",
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "1AB609AF-46E8-44D2-A7AC-60F4BFDBDBB4",
                      "scope" : "pattern_typed",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "002CBE60-D41E-4E1D-B697-7970D39D647A",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "implicit"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "C0C72ACC-60A4-4EF1-84C4-B28142AFD706",
                      "name" : "TestEnum.hash(into:).self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "A3B6C105-ADEA-41F4-8EF2-1EE5986F2A17",
                          "name" : "TestEnum.hash(into:).hasher",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=into",
                            "inout",
                            "interface"
                          ]
                        }
                      ],
                      "id" : "5F4B125B-037E-43DC-A928-BF6992AD1FBB",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "07274C4C-319E-47FD-9BAA-3CA01A7E6381",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "discriminator",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "35AB7C4B-E5D4-4B44-9133-D16075A72967",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "85554872-E187-47C5-862F-69560654465E",
                          "scope" : "pattern_binding_decl",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "E1256B09-A2D1-4DC2-8B78-437D9D825222",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=unapplied",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "5C3F58BA-C955-43B2-9E09-28B8DBCD0AE3",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "204A60AA-5D01-4BB7-9DBB-882C5157E5E7",
                                  "scope" : "case_label_item",
                                  "tags" : [

                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "A17FE203-A6EF-4840-92E5-78D1277D8215",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        },
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "id" : "5CF69C3B-95E9-40F1-A67B-74FE462926A9",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "59135B80-3651-47AA-98B3-587F47C7AB64",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "FC8A9B70-AE19-4863-A8FA-0B9FC1EDF940",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "32660D1F-BF43-4515-8540-029E9F4B730B",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "1D16A72B-15CB-4D3B-86D0-251270A47615",
                          "scope" : "switch_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "7A21ADAD-8186-4AA5-993A-21B6FED76144",
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=single",
                                    "implicit"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "323C82CD-E9B2-45BF-ABD2-4DDAD9318DA9",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "601F0B61-AA78-4819-B437-578B5E9BA7A3",
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "2DD4C7E0-D004-484D-92AD-5210460DF087",
                              "scope" : "dot_syntax_call_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "E74E3117-5F47-4128-B86C-039C5F6EE763",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "993FB51F-CC7B-4950-A80F-2D0F47627DBD",
                                  "scope" : "load_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "C68034B1-6D27-4BF8-B3A2-F97AF6309EE7",
                              "scope" : "paren_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "795F2567-16E5-44DA-A145-E52ABD1CC463",
                          "scope" : "call_expr",
                          "tags" : [
                            "arg_labels=_:",
                            "implicit",
                            "nothrow"
                          ]
                        }
                      ],
                      "id" : "0697F50F-CA89-4672-855D-31635CE5B503",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "C440C7B7-3B40-41F1-9279-A52D5D89DF30",
                  "name" : "TestEnum.hash(into:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "A290E48F-1CB1-493D-98A6-81A52E829113",
              "name" : "TestEnum",
              "scope" : "enum_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "DFDD12F2-7956-48FA-B3A1-4B0352CA4CB7",
          "name" : "TestStuffSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "714AFD63-43A4-418B-8B19-29A9BE5A7204",
      "name" : "CocoaPod",
      "scope" : "module",
      "tags" : [

      ]
    },
    {
      "arcs" : [

      ],
      "children" : [
        {
          "arcs" : [

          ],
          "children" : [
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "0BA27A65-CABB-4991-B648-34776EFBF87D",
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [

              ],
              "id" : "326FF51C-ACB5-493D-B3E1-1704A1351EF7",
              "scope" : "import_decl",
              "tags" : [
                "CocoaPod"
              ]
            },
            {
              "arcs" : [

              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "23A48618-0271-4951-81B4-E8BAEEF129AB"
                      ],
                      "children" : [

                      ],
                      "id" : "3B144C59-752F-401A-B087-6F2FCF03348D",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testClass"
                      ]
                    },
                    {
                      "arcs" : [
                        "23A48618-0271-4951-81B4-E8BAEEF129AB"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "23A48618-0271-4951-81B4-E8BAEEF129AB"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "23A48618-0271-4951-81B4-E8BAEEF129AB"
                              ],
                              "children" : [

                              ],
                              "id" : "5050ECF2-1BCF-477B-B899-545635796707",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "BFABEF08-6ABF-448F-9B5C-1365E69C1930",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "8AA33972-F95A-4F16-9AE5-8E44F2491398",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "B7E5E261-ED44-4CA6-86AA-59C9CC5F15A9",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "8267EEE2-97B9-4602-A323-806F5FA90092",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        "23A48618-0271-4951-81B4-E8BAEEF129AB"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "23A48618-0271-4951-81B4-E8BAEEF129AB"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "23A48618-0271-4951-81B4-E8BAEEF129AB"
                              ],
                              "children" : [

                              ],
                              "id" : "A4685173-55CB-4294-BF8A-8D6ACF01D7E3",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "8915AFC6-6E92-480C-818E-96C5541122E5",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "0ABA82FB-79CA-4D26-896D-E0F0A2EE47C4",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "CD164B32-6F87-4DE0-B55E-3D618B6E4E1E",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "BB5B0A89-E4ED-4072-A968-2403D27421A8",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "571D912C-A611-4749-BB07-0C50110218E0",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "23A48618-0271-4951-81B4-E8BAEEF129AB"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "23A48618-0271-4951-81B4-E8BAEEF129AB"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "63C3EED6-83DB-47E3-BE88-7B486C664EF7",
                          "name" : "AppDelegate.testClass.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "FA560D82-BF80-4F31-9C44-89CA69F919D3",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "23A48618-0271-4951-81B4-E8BAEEF129AB"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "4888C4C8-08F0-4E8D-925A-68C0BA276541",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "5CD96165-0673-4E22-B214-CDB21151EE35",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "E7763179-1136-414E-9060-3513C38B488F",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "ED247B7D-A616-4DC5-8169-F3E0A7B06A69",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "479A87D0-8859-456B-AE71-A26076819C15",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testClass",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "00BD1749-6C62-48E1-BEA3-9CC801E0A020",
                  "name" : "AppDelegate.testClass",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                      ],
                      "children" : [

                      ],
                      "id" : "9C72FEB1-8D2B-4499-BC1E-F0D9E6BA07E7",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testStruct"
                      ]
                    },
                    {
                      "arcs" : [
                        "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                              ],
                              "children" : [

                              ],
                              "id" : "D6C1CEB8-0AF8-4B5A-8FBB-C78AF1CAB07A",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "05A810A7-8DCB-4B09-B7C1-89F927D0C201",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "ED1DA3CA-8E2E-4B2C-99BD-4BAE27F01C51",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "EB447C45-F1A3-41CF-A9E4-F17F41757888",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "CCE9A41B-356E-4740-9BB9-ABD38D9EB365",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                              ],
                              "children" : [

                              ],
                              "id" : "36C1758E-87E0-4447-86B7-0A128A53A35E",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "1A15CF7D-EA3F-452C-9243-7023FB1C31B7",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "09253F1F-99DF-4CFA-B668-0BB8F774AD74",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "A911FE52-4376-4318-9D11-A6BBCF8DA420",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "8D6BAEB9-9905-4260-B6F2-E9107DE13350",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "1E15A67E-1C19-4251-B10D-88EB1D5CBE70",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "A27D9F02-E483-4FAC-B0FF-8737E57174B4",
                          "name" : "AppDelegate.testStruct.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "83364786-B498-470E-8F7E-09FB1682CA66",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "7CECF17E-3CC2-41B5-B760-9DBA9A32F558"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "B1B01859-0221-492A-8BF4-7BE7B74799AC",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "7E6EEFAD-AA05-49A6-9DE0-80BAF7347487",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "A7A41E3D-A038-47D8-829F-7083A0BA66EF",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "309157C0-AEEA-4ED3-B9DE-36B082BDB3F0",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "C331B704-08D9-4F7D-96A4-ACE0A7703166",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testStruct",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "499EFAE2-DB90-41BE-8FE4-5D0128A43F5C",
                  "name" : "AppDelegate.testStruct",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "A290E48F-1CB1-493D-98A6-81A52E829113"
                      ],
                      "children" : [

                      ],
                      "id" : "69B0ADB8-9544-4E13-AE50-74E4D3F1BB50",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testEnum"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "C71C77DF-C199-4F9F-9F26-8B97DBDC7B39",
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "id" : "914CA715-57E5-4250-BA43-69D0BE446F1F",
                      "scope" : "unresolved_dot_expr",
                      "tags" : [
                        "field",
                        "function_ref=unapplied",
                        "test"
                      ]
                    },
                    {
                      "arcs" : [
                        "A290E48F-1CB1-493D-98A6-81A52E829113"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "A290E48F-1CB1-493D-98A6-81A52E829113"
                          ],
                          "children" : [

                          ],
                          "id" : "DAC07D27-3D35-4C8D-A6A4-C15E915D644F",
                          "scope" : "declref_expr",
                          "tags" : [
                            "function_ref=unapplied"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "292E6F47-F952-4B57-818B-9B6B91D206AE",
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "id" : "BF7D454D-51DB-45D0-B419-1696EC08B3D7",
                      "scope" : "dot_syntax_call_expr",
                      "tags" : [
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "449EEEAB-65F1-4944-BE2D-9C2DCB577A10",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "A290E48F-1CB1-493D-98A6-81A52E829113"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "A290E48F-1CB1-493D-98A6-81A52E829113"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "338A50D8-102C-49D0-B0E1-7A4DEB6F9924",
                          "name" : "AppDelegate.testEnum.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "6DB4EBF8-1968-4586-8721-0C76ACB439D1",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "A290E48F-1CB1-493D-98A6-81A52E829113"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "46260B47-AC1A-439F-B304-9237AF07F859",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "336D3064-859E-462A-9772-1722F3D23AF4",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "99B2E91A-5835-4866-907E-6696F58F6C67",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "A52D8C53-EA01-43DC-BF8B-2CA95B013F71",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "592BDB29-9077-449F-A933-7BA2F2443776",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testEnum",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "DFBF1BD4-42C9-4F30-AB2C-AEAA59E95A0F",
                  "name" : "AppDelegate.testEnum",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                      ],
                      "children" : [

                      ],
                      "id" : "F03BCDBE-9423-4F83-8018-3EC986FEB1A5",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testGenericClass"
                      ]
                    },
                    {
                      "arcs" : [
                        "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                              ],
                              "children" : [

                              ],
                              "id" : "898BBDB1-0AAC-421B-A439-E777D79A2D9A",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "4F52CE6D-95C0-4FAB-B0C8-980290B209F6",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "D2623FD6-8152-4A43-AA14-FCD9BC6E29AE",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "C2798B8C-3E3D-474E-A4E7-68012D514BFD",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "2990B165-2DF0-4C75-B1FD-D603D096554C",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                              ],
                              "children" : [

                              ],
                              "id" : "6ACC8EEE-F45E-426B-AC45-3EC24AEE927A",
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single",
                                "implicit"
                              ]
                            },
                            {
                              "arcs" : [

                              ],
                              "children" : [

                              ],
                              "id" : "6CD6DBD5-3B4E-4247-AF4B-1FC553216481",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "DA0518B8-38B6-455D-9608-DE4BF8F45736",
                          "scope" : "constructor_ref_call_expr",
                          "tags" : [
                            "nothrow"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "4285994A-8528-46F3-9F51-4030A6F3F6D8",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "F500A9C0-71DF-4AA5-B6BA-4C01E487BD3D",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "245B7942-B59B-416B-92A8-DBD23704274D",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "2951F04C-313E-43F7-9A03-11486DD097B0",
                          "name" : "AppDelegate.testGenericClass.self",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "C92C4C7C-509C-491B-A1EA-22B6C1238A51",
                          "scope" : "parameter_list",
                          "tags" : [

                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "E8E0C544-6C79-43B0-B15A-153D5141B76F",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "659619E2-F172-4641-AD2C-8732051606D5",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "B9D18F1D-DD2F-4BD2-89EE-5B226B52D510",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "F8043045-7122-455E-B22B-FFEB2894139B",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "D91217CB-A28F-485A-80F4-8F2985C96BE5",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "final",
                        "get_for=testGenericClass",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "178C1AE2-D89F-4D04-BF2A-DF3D7340E0BF",
                  "name" : "AppDelegate.testGenericClass",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "immutable",
                    "interface",
                    "let",
                    "readImpl=stored"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "D054262F-43C4-40A3-863E-4B2A0BC97B57",
                      "name" : "AppDelegate.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "7D65C66E-3002-4C01-BA1D-03067CA3599A",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "49AB3A9C-D064-493A-B8B6-EBE365FBBD2E",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "8F53B922-409E-48F4-81B9-3890FDA0314E",
                  "name" : "AppDelegate.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "D99C244A-1AA1-41DF-93F9-2459351B9BA4",
                      "name" : "AppDelegate.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "D56B775B-F945-4CCE-90C2-005F864C9187",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [

                              ],
                              "children" : [
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "A6BA1DF9-5828-4D23-B516-C2EB7A2EA8B3",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "B5ABC888-631A-4C33-9B66-F56F7AF1763B",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "9BD72347-DC55-4BBF-B801-6D91834C2BE1",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "FC79F4E6-BE3E-4831-AAEF-4FBC6F387C99",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "4F36DC03-6F11-4945-9110-7DB8A24B3864",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "2CC762EF-A1B8-4FA0-A469-936A9EC846EB",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "F03AC6BB-A735-4CF8-A876-AB5373DAEFD7",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "C0575DA3-F4CA-4127-90D5-C5BC1DC68717",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "C1DAE711-6E62-4B09-9A40-27D5D63807E9",
                  "name" : "AppDelegate.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "D22EA17E-73D1-43C1-A019-A9049D4A700C",
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [
                "23A48618-0271-4951-81B4-E8BAEEF129AB",
                "2F42A42E-C0F7-404E-B83B-60E280B73DEA"
              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "DD5DCBBF-AB8F-4832-8F60-38E5D2756A37",
                      "name" : "TestChildClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "DCF04CF2-512D-41E5-AED9-47153B681DFC",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "08F970C5-99E3-4E54-BBF5-20CFE8D7D5B5",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "8A28CBA2-2B43-4E91-91EC-FDD0E7605B13",
                  "name" : "TestChildClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "9B2B6B61-CDE4-4440-9CF8-D52930AE9FC8",
                      "name" : "TestChildClass.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "364E8EF8-485D-43FC-9425-71E9F21299EA",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "23A48618-0271-4951-81B4-E8BAEEF129AB"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "23A48618-0271-4951-81B4-E8BAEEF129AB"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "23A48618-0271-4951-81B4-E8BAEEF129AB"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "3B34A1BA-018B-42D8-94A7-17EE53D04CB7",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "23A48618-0271-4951-81B4-E8BAEEF129AB"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "F3845830-EB67-4FB7-9EA4-3584621210D3",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "B9892656-4394-457D-908C-32E4799B63C8",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "CC933AAA-795A-475A-94A0-60592AEEA7D5",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "5401D8CD-16B2-4A19-823C-B8DE66026477",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "33A8F1C0-7435-44B4-B9C1-8064F0D1D60C",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "A6FDB912-B5E0-4DF7-98EC-03E8693F37BF",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "E43B62CB-C4BB-46AB-BD85-6E6B5893B218",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "C0B1908B-C70A-4CF9-938F-EAE3B215E254",
                  "name" : "TestChildClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=internal",
                    "designated",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "87E99E64-6A0B-491C-8348-827C609F0A58",
              "name" : "TestChildClass",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            },
            {
              "arcs" : [
                "2F42A42E-C0F7-404E-B83B-60E280B73DEA"
              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "040B700B-E936-4DF8-8047-53A86EC6970C",
                      "name" : "TestGenericChildClass.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "A7E1C2B7-9B6F-4270-94CB-7C470B4B9C18",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "002EF4CA-260A-4690-BCC9-8EFDF4816F2C",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "5E213FEC-5C29-41EC-A681-7AF4911522F2",
                  "name" : "TestGenericChildClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "F9114AFF-FD4C-4D67-A174-9B6C1331F75A",
                      "name" : "TestGenericChildClass.init().self",
                      "scope" : "parameter",
                      "tags" : [
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "EDE6A101-04AB-4313-B36F-F56107E5C723",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "77E58E3B-EF31-48AD-A5FC-9EBC57210BDC",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "BF84FA06-1EBB-4A9D-A994-040AE1A2C0E7"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "BA790D3A-CC11-437F-A669-2C8FA0E70C04",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "2D18778A-76BA-4F4F-895A-5B0C3E594151",
                                  "scope" : "dot_syntax_call_expr",
                                  "tags" : [
                                    "implicit",
                                    "nothrow",
                                    "super"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "C19C953E-165B-4B28-99F1-DB7457A2343C",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "803CB5D2-981D-43BE-AE0F-96D1068BE1DB",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "500AA681-EC5B-4A6C-8638-743C5C41C5D4",
                          "scope" : "rebind_self_in_constructor_expr",
                          "tags" : [
                            "implicit"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "30547C1C-8537-481F-87D1-044A0335D204",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "C4D8645D-4025-4939-8C09-D1DFD9662F7A",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "F1717F4C-F867-4213-9AF3-DC3E0FB961E8",
                  "name" : "TestGenericChildClass.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=internal",
                    "designated",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "566A93AA-1FB0-42F7-9DE5-B7F940C20AF4",
              "name" : "TestGenericChildClass",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "F88AD99A-F759-44F8-9C25-A8BA208B9DA0",
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "C9B6A110-DF94-4136-BB84-243C42895A55",
      "name" : "CocoaPods",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "id" : "CA52E362-1EE5-43FC-9B4E-F15C555997B3",
  "scope" : "root",
  "tags" : [

  ]
}
"""

}
