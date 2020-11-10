// Copyright © 2020 Stephan Lerner. All rights reserved.

import SwiftUI
import CoreArchitekkt
import SKArchitekkt

@main
struct SKArchitekktExampleApp: App {
    var body: some Scene {
        DocumentGroup(newDocument: document) { file in
            SKArchitekktView(document: file.$document)
        }
    }
}

private var document: Document {
    let nodeRequest = NodeRequest(url: URL(staticString: "/TestProject.testproject"), options: ["scheme": "TestProject"])
    let data = nodeString.data(using: String.Encoding.utf8)!
    let node = try! JSONDecoder().decode(Node.self, from: data)
    var document = Document()
    document.set(nodeRequest: nodeRequest, node: node, warnings: [warning])
    return document
}

private let nodeString = """
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
              "id" : "A06322C9-B86A-454C-B576-E7970128E643",
              "scope" : "import_decl",
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
                      "id" : "0C58AF96-C52F-4858-A638-76C34C529A5C",
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
                      "id" : "DBA66B6A-D8FA-4292-AB59-38702B314CAA",
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
                          "id" : "966C2F63-11D2-4CA3-9C76-1361529B1072",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "B4FF324A-B9F1-4799-B66B-1C2A434704B3",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "2D4645EE-6849-4434-A5C2-6A21CB1DBE69",
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
                      "id" : "01326392-07D0-45F9-AF9E-BE2A11DB638D",
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
                      "id" : "B7FE9103-3218-4864-98BB-F564E693A31A",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "B1F2E932-51EC-409F-8D0C-F4AC046E55BD",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "37FFF783-843F-4E88-A486-A276D3EC8F56",
                  "name" : "TestClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "F3689262-D299-43FA-9C64-C922E2ACAB15",
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
                      "id" : "2B0D2DCC-065A-486E-9BA5-22CD4AA7EF11",
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
                      "id" : "9E25B4F3-BE4B-47A2-BBE4-46A00CA05C2F",
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
                          "id" : "E43E892C-C985-4469-B4AD-306646D43199",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "99C22F22-3913-4FE6-A20D-2B7EB5586801",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "81E85558-F610-49B7-BFEA-A9CA7F9F23E3",
                  "name" : "TestStruct.init()",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "access=public",
                    "designated",
                    "interface"
                  ]
                }
              ],
              "id" : "9D98C8FE-C608-4F57-8978-FA256ABC0FA5",
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
              "id" : "88ED8282-A252-4459-B9AA-7B0E1157355B",
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
                      "id" : "BB23C51B-B8C8-4EF9-8E62-DDD972638F2F",
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
                      "id" : "614C1CA9-4587-48C4-8CFB-DA552F800165",
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
                          "id" : "CCAE5143-7377-492E-8E52-07326838C3D4",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "1B53DDF6-BDBB-483C-A722-A6E58466480F",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "42AF0687-BD4D-4B64-9810-86D0630AB8E9",
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
                      "id" : "649F5FBA-E440-4D2A-A107-C97289542839",
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
                      "id" : "08C28B64-5892-48A9-9F58-C92D043E6E2B",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "6745F801-A75F-437D-8136-8DF8C3491B3E",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "C8DCE690-4DF0-49FF-A59D-F1F0BBEB63A0",
                  "name" : "TestGenericClass.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=open",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "0A6F97F9-927A-49C7-A74E-48175ADF7FCF",
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
                      "id" : "B5AE832A-2927-4577-8E02-BEF7223516C4",
                      "name" : "TestEnum.test:5C7F6E90-F638-4F6C-94F9-511854F9353D",
                      "scope" : "enum_element_decl",
                      "tags" : [
                        "access=public",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "68768274-68DE-4FD9-9EBC-96C557DA06B6",
                  "scope" : "enum_case_decl",
                  "tags" : [

                  ]
                },
                {
                  "arcs" : [

                  ],
                  "children" : [

                  ],
                  "id" : "20155692-2DBE-44E4-98C2-AB16F5147F67",
                  "name" : "TestEnum.test:2F615714-EF0C-4135-A8F6-C6FB827D95DD",
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
                      "id" : "993CFA57-1E6C-49C0-AA50-D62EE11959D2",
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
                          "id" : "564F48C4-F027-4622-8E0F-D390B19F2A25",
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
                          "id" : "F2406DAA-02CE-4761-9F71-FF70BFED113F",
                          "name" : "TestEnum.__derived_enum_equals(_:_:).b",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "3953504E-D293-4D21-85D6-B404DA599780",
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
                                  "id" : "C905A240-03E8-4516-B469-9D76B80A4D3E",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_a"
                                  ]
                                }
                              ],
                              "id" : "1261E0B7-A00F-4742-840E-8416251B8D61",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "BF16DE00-ECBA-42C4-9DFF-4FE2F5D65216",
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
                              "id" : "C59E30E7-E036-4732-9D7A-3163DC15949C",
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
                                      "id" : "D5EEBC0C-4C6A-4B85-8AA4-9F376C101998",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "E9438EA2-B46A-4D89-B129-8A880E7D4BB2",
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
                                          "id" : "EE978EC5-BD8C-46CB-BD9D-61072AC712B4",
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
                                          "id" : "1A28F681-1F72-44D2-A0DF-26EFC2C5B92F",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "0D39A955-DEA9-4AD8-A895-34DA04A98B0D",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "CBCA1585-7692-4A61-89E4-225880B4A2A4",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "5E7BE5FF-C734-41DB-B7B5-F8B766213A7B",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "0FFB6EF9-BB2D-4A9B-ABA8-B09260692B6D",
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
                                  "id" : "201B0A0C-2B80-4C63-BD39-E71E836E8CC9",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "implicit",
                                    "index_b"
                                  ]
                                }
                              ],
                              "id" : "228639D4-DC54-4AC5-8D7F-12DC6EA72123",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "B0148ABE-3688-467B-A234-591EF6DCB12D",
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
                              "id" : "2B1DFB17-C9BB-461C-96CF-D24CF5C5EA68",
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
                                      "id" : "C464037C-AC79-4D26-8D78-0CC88802CA6B",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "85464D55-0728-4AD7-8583-89ED11474A41",
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
                                          "id" : "D51ED18B-4884-4644-910C-1567F9A6A798",
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
                                          "id" : "BE63F43E-0215-4EFD-A85B-83EC095574DD",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "81D3727A-989F-4523-B130-40C97F93EEAF",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "5C27A0F9-FCFA-4BF7-87E2-DFD95D7F3F9F",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "B4F5967B-81F8-4C4D-A49A-D225DF84427D",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "572B5B65-9547-48BB-A114-5F1E9775B0D4",
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
                                      "id" : "E81E309B-6387-4758-8EF2-6C3C9040CA60",
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
                                      "id" : "85F32ACB-4A25-47A1-8323-05CD99EB16FD",
                                      "scope" : "type_expr",
                                      "tags" : [
                                        "<<NULL>>",
                                        "implicit",
                                        "typerepr="
                                      ]
                                    }
                                  ],
                                  "id" : "788D0850-B97D-4919-AB72-8A9172D4A3E6",
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
                                      "id" : "DFE88FDA-6757-44CC-BF60-8C5072EEB60E",
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
                                      "id" : "FE89EF1B-5C9C-44F5-945C-F22874CE8E11",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "C103C45B-0AD3-4EA2-A9D7-590347326E65",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "AA046395-BF5B-4642-A6B1-C797555CA5B5",
                              "scope" : "binary_expr",
                              "tags" : [
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "7739A4C1-2EC4-424E-8661-6750AD826988",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "7F75A738-8546-49E3-8555-6749B4E67048",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "AE5D3BFA-89DA-4F8D-9FBA-A52A3765A194",
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
                          "id" : "30D5B4DC-C79A-4D30-8D2F-F4F591803379",
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
                          "id" : "5EE63B7C-E6DB-428C-9F43-D244827BBA85",
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
                                      "id" : "1751B703-9966-4521-9C53-DC112475CC13",
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
                                          "id" : "6E9D49FD-2B41-4905-97D6-B587DFEBD829",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "id" : "85E32E2A-D70A-4A57-834B-B43F98E114B0",
                                      "scope" : "tuple_expr",
                                      "tags" : [
                                        "implicit",
                                        "names=for"
                                      ]
                                    }
                                  ],
                                  "id" : "DF084689-C4D1-4E12-9EF4-F1AC344C6227",
                                  "scope" : "call_expr",
                                  "tags" : [
                                    "arg_labels=for:",
                                    "implicit",
                                    "nothrow"
                                  ]
                                }
                              ],
                              "id" : "DA24CC2B-9652-4329-8C0B-2D031A472A34",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "7FB9ADAE-F79D-4C6C-9812-2E11AB1E0354",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "4D3BC66F-9DB5-439B-80D7-F772B2991F58",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=public",
                        "get_for=hashValue",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "01E00FD2-28E8-46D3-907B-C46AC6A9BCD3",
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
                          "id" : "1BBCD989-D29D-43FD-A4F2-F17B43398BC4",
                          "scope" : "pattern_named",
                          "tags" : [
                            "hashValue",
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "39C407BD-0A81-4F33-A176-473479A0DCBD",
                      "scope" : "pattern_typed",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "E5B1A481-7FDF-4722-828B-DEE50671E9C6",
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
                      "id" : "55D6F824-0E38-461D-83D4-62048D29A704",
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
                          "id" : "CF5FBBE4-6DB4-4846-B5AC-F02CEE0F9712",
                          "name" : "TestEnum.hash(into:).hasher",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=into",
                            "inout",
                            "interface"
                          ]
                        }
                      ],
                      "id" : "42675BA1-14AF-4880-8626-7AE6608FEE3C",
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
                                  "id" : "50C8C9F7-CCB8-4C7B-BE7F-805BAC48DF83",
                                  "scope" : "pattern_named",
                                  "tags" : [
                                    "discriminator",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "2E0A3E73-2FC2-4F95-AC9F-9736C593FB9D",
                              "scope" : "pattern_typed",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "684B2603-F806-4B25-91E2-D8F076A90125",
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
                              "id" : "8734021B-67B7-4563-AE50-E71F1CDF968B",
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
                                      "id" : "C8DFA53D-7B3F-41D9-9AF8-C893F1018239",
                                      "scope" : "pattern_enum_element",
                                      "tags" : [
                                        "TestEnum._",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "962BC0CA-23C1-40CC-8B60-3896E9AE210C",
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
                                          "id" : "1398814F-F1C7-4DAE-8FF9-CFBDC9C9DACE",
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
                                          "id" : "A7EC8CBA-6E3A-4C67-B4E1-A17DB79A801F",
                                          "scope" : "integer_literal_expr",
                                          "tags" : [
                                            "implicit",
                                            "initializer=**NULL**",
                                            "value=0"
                                          ]
                                        }
                                      ],
                                      "id" : "7ACFE04B-D770-4FA3-84BB-CC16B30E8A26",
                                      "scope" : "assign_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "03D2DDC9-3240-46C7-AA08-B92FDAFC5FC7",
                                  "scope" : "brace_stmt",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "ECA2FCF5-52F3-46FA-8B9A-C926610F6273",
                              "scope" : "case_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "D8A9E6C9-82AF-409B-933C-A0E2F25010F3",
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
                                  "id" : "58752BE3-9624-44C3-8D71-8909F290CCBB",
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
                                      "id" : "C397515A-2504-46CF-8549-4E754E704537",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "B57D1A6F-36E6-44D4-80EF-2A8A27834FAE",
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "36976DD6-AD0A-4D57-A02F-05063C5B5A75",
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
                                      "id" : "1C541AFB-1346-41FF-8D74-101B7FA382F5",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "ADD157F6-078A-4D01-AE5A-0C963380167A",
                                  "scope" : "load_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "E5DCEE78-48E7-4A52-9CBE-EF3E5954801C",
                              "scope" : "paren_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "D02B5CBF-7D0E-4E81-AD23-5745CD4EE9FF",
                          "scope" : "call_expr",
                          "tags" : [
                            "arg_labels=_:",
                            "implicit",
                            "nothrow"
                          ]
                        }
                      ],
                      "id" : "63EDEF77-567D-4064-9881-DA152CE476CF",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "C916D66C-CD22-43A3-9740-CC0B668338C6",
                  "name" : "TestEnum.hash(into:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "access=public",
                    "implicit",
                    "interface"
                  ]
                }
              ],
              "id" : "C06C0EA6-635B-47D0-BF60-23532592A80F",
              "name" : "TestEnum",
              "scope" : "enum_decl",
              "tags" : [
                "access=public",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "7B22C8A6-2DA3-44C6-91DA-2E2ADC285B4F",
          "name" : "TestStuffSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "12572D7F-5DE8-4C4C-8A57-88FAB0EF7A97",
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
              "id" : "0461E990-0D8E-421C-9314-8EA23511A58B",
              "scope" : "import_decl",
              "tags" : [

              ]
            },
            {
              "arcs" : [
                "12572D7F-5DE8-4C4C-8A57-88FAB0EF7A97"
              ],
              "children" : [

              ],
              "id" : "2A6513CE-B8D3-4AC0-9C7D-C47C5563880D",
              "scope" : "import_decl",
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
                        "F3689262-D299-43FA-9C64-C922E2ACAB15"
                      ],
                      "children" : [

                      ],
                      "id" : "77A2F889-C065-4EDB-9A30-D95F133E9705",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testClass"
                      ]
                    },
                    {
                      "arcs" : [
                        "F3689262-D299-43FA-9C64-C922E2ACAB15"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "F3689262-D299-43FA-9C64-C922E2ACAB15"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "F3689262-D299-43FA-9C64-C922E2ACAB15"
                              ],
                              "children" : [

                              ],
                              "id" : "BCEB8468-2D10-4C16-8975-4854B4FEFDF7",
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
                              "id" : "E435B485-F304-497F-A74D-FD1938E46C70",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "2340B2F8-161C-4F00-800C-401C2786DCEE",
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
                          "id" : "D2A7A15B-0852-4A07-8351-20E76A17342F",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "73ED5A78-B6DD-4672-9540-634773BA1175",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        "F3689262-D299-43FA-9C64-C922E2ACAB15"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "F3689262-D299-43FA-9C64-C922E2ACAB15"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "F3689262-D299-43FA-9C64-C922E2ACAB15"
                              ],
                              "children" : [

                              ],
                              "id" : "0FB1E5A5-DCB7-417E-A5DA-04BB7D0707E0",
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
                              "id" : "63EB1F06-35ED-4079-A4CC-2DC9DBA2A930",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestClass",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "D5EFAB15-3450-40B0-BCD3-F3B610F7F1C1",
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
                          "id" : "2F235102-F966-4D6D-9753-F442567E52E6",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "88B586CC-6CCE-4B2D-A177-05F817858368",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "22AB57F0-1265-4710-8947-A4F06A40C79A",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "F3689262-D299-43FA-9C64-C922E2ACAB15"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "F3689262-D299-43FA-9C64-C922E2ACAB15"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "B12CCC50-944A-432E-832D-09E3FCA1D3F9",
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
                          "id" : "4525DDFB-9A80-4E95-BEDE-4A1C63E49D39",
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
                                    "F3689262-D299-43FA-9C64-C922E2ACAB15"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "EF7726D1-2C1C-4770-9283-27E040703BDF",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "E1FE719B-C5FA-491C-8CBF-7352CF6648F2",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "357EA8DF-87DD-4B70-8C7F-2148BF94D173",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "A5B8A790-2004-4F2F-802B-529399E2FC33",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "6E29D242-351A-4EA8-B1E7-A0B7790A753C",
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
                  "id" : "9F522FEE-6635-40DC-B5D8-5B8BA5669815",
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
                        "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                      ],
                      "children" : [

                      ],
                      "id" : "DC90755A-5758-4D26-BCCD-B12C4C7E2612",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testStruct"
                      ]
                    },
                    {
                      "arcs" : [
                        "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                              ],
                              "children" : [

                              ],
                              "id" : "A1AE090A-EED8-420A-8B8B-049E3BE51798",
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
                              "id" : "DC8AEAC1-AECE-411D-B87E-D54F17A11836",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "E3149223-FBEF-4153-A36D-A7BE0821DC9C",
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
                          "id" : "D74576D5-EBAC-41FA-A7B1-3F6430F9E5CE",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "6D340734-06D9-4F02-AFCA-C097B6AFEAE8",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                              ],
                              "children" : [

                              ],
                              "id" : "58D60765-4E65-4C59-A311-AFCB4027D57D",
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
                              "id" : "FE892C1B-6138-4452-BC64-6D240311FAC6",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestStruct",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "CECBDE8F-3588-4A4D-A415-B83F52DC0F3E",
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
                          "id" : "25B2A233-D723-433C-92D4-BB6D4C9E297B",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "F253CD90-6F05-4895-8595-149CB86FD9C3",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "6EBF728A-C383-4809-8764-5A54373C36B9",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "C31DC69A-FA4B-4011-A7C4-9FFD3BAF2B37",
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
                          "id" : "56507D6F-7791-47A8-8762-0706130FF739",
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
                                    "9D98C8FE-C608-4F57-8978-FA256ABC0FA5"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "83256EC5-AE09-4A7B-B591-E9E11C3B1DAD",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "D50C0A90-475B-4B78-A406-4594CDDA8CC8",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "F72718AA-8709-4A78-A15A-E1E863927E0A",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "EE459C6A-3261-4A9A-9317-2152686A1D5A",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "84507AA0-4F68-4259-9EBD-81C3DAD7850A",
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
                  "id" : "F61E8DAE-8B52-47AA-8D0B-F06155A42CF4",
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
                        "C06C0EA6-635B-47D0-BF60-23532592A80F"
                      ],
                      "children" : [

                      ],
                      "id" : "7CCC06BA-6E6C-4508-818F-4E7D27E936A9",
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
                          "id" : "EC8376EF-A768-4333-9B50-FE340DCEDB32",
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "id" : "0FE5F2B6-EC20-4C45-AD31-30398B045071",
                      "scope" : "unresolved_dot_expr",
                      "tags" : [
                        "field",
                        "function_ref=unapplied",
                        "test"
                      ]
                    },
                    {
                      "arcs" : [
                        "C06C0EA6-635B-47D0-BF60-23532592A80F"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "C06C0EA6-635B-47D0-BF60-23532592A80F"
                          ],
                          "children" : [

                          ],
                          "id" : "26E0E359-4B51-4B59-A380-94DAC7CF9D54",
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
                          "id" : "97380DE8-8AF2-4952-942B-488034FDB2E5",
                          "scope" : "type_expr",
                          "tags" : [
                            "TestEnum",
                            "typerepr="
                          ]
                        }
                      ],
                      "id" : "9285E2A1-43C5-4BDC-90A5-7A18BE842E7B",
                      "scope" : "dot_syntax_call_expr",
                      "tags" : [
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "CEB985EE-978E-4FFC-95E3-85AD155A81F5",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "C06C0EA6-635B-47D0-BF60-23532592A80F"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "C06C0EA6-635B-47D0-BF60-23532592A80F"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "1E629226-08ED-4346-BCFE-4E36BFD2D57B",
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
                          "id" : "42FD048C-F638-46D7-AD03-7CC69D05AEB7",
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
                                    "C06C0EA6-635B-47D0-BF60-23532592A80F"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "6F327802-CB99-4FD5-8FA5-C5250451D5F0",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "AE16D63B-3E58-4F06-AD46-56762860BA25",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "49784ADB-57FB-41A5-B8FA-61C2EE3984A3",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "0A87FEA0-EA5C-4D02-9012-B93CF2454856",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "7E8CBFD7-439A-46C3-AA4B-101EBCC8BEBD",
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
                  "id" : "45C72563-EF67-4EF1-A169-8A7BCDDE9B1D",
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
                        "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                      ],
                      "children" : [

                      ],
                      "id" : "6962BF5B-90CF-4C7D-AA50-75DA663DAFCB",
                      "scope" : "pattern_named",
                      "tags" : [
                        "testGenericClass"
                      ]
                    },
                    {
                      "arcs" : [
                        "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                              ],
                              "children" : [

                              ],
                              "id" : "EC7DF241-E7DE-47DE-A39C-FBCEF9C5B931",
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
                              "id" : "80D5EA23-1872-455E-A447-406483B6DE22",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "73DF467E-57D7-4FFC-AFAF-450E5785A949",
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
                          "id" : "825711B0-E5B3-4A1B-B668-C4618F4944A5",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "36E6C754-1164-4E0B-98FC-6935E01547C6",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    },
                    {
                      "arcs" : [
                        "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                              ],
                              "children" : [

                              ],
                              "id" : "1185E74E-8D21-4A87-8D4D-90D6BDF15C3D",
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
                              "id" : "2F64F82D-ACF3-40AB-A0F6-544EC5D623BC",
                              "scope" : "type_expr",
                              "tags" : [
                                "TestGenericClass<String>",
                                "typerepr="
                              ]
                            }
                          ],
                          "id" : "C0391031-3F06-454E-8A3C-F76D030FE367",
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
                          "id" : "82F9CFE3-FF51-4967-B809-7C23FD02A4DC",
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "2B62F96C-709C-42DD-AF7A-F873B3CBF564",
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "id" : "0BD1BA2C-092E-4937-97EF-7549F690CBF6",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Original",
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "80E26A4F-34D1-454C-AFD2-B0E330038D96",
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
                          "id" : "116F9EBC-0097-4F50-8C97-E7A92CF14747",
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
                                    "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "id" : "8033BE02-CE40-4F4F-945B-AD79288A790C",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "A5C8C2E6-21E4-47F5-B570-F14E08BB28C2",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "D198BD32-970E-44CD-87E3-7FFBBDB9A1CB",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "E4F92438-4235-4C84-9908-E92135EC2328",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "ED14F4BF-0359-4B43-866B-B7FB61097813",
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
                  "id" : "21E567B5-80A2-4152-ABF3-BBB6977505EF",
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
                      "id" : "63C3979E-8F7A-4443-B47E-7A523CB9DA3A",
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
                      "id" : "7683E495-786C-4A4E-9F09-874A87AADCAA",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "465074F7-64A7-4B5E-A33A-A0ACB5CF52BD",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "6C75D8E3-D42A-406B-A61D-E21EF107C591",
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
                      "id" : "107F5EAB-B19C-4650-A85B-FE7BA8FB5373",
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
                      "id" : "6D4B4641-F83F-4D17-B0E2-6772AE89E5F4",
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
                                      "id" : "22F689AC-AC80-49FB-B0B7-90D3766B3009",
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
                                      "id" : "58D3AFD7-74F7-4090-94C9-BC8C5A988A3A",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "6FA178D6-4176-4CFC-B143-BE738606FE9D",
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
                                  "id" : "39C6C000-8F27-43F2-9388-1696368210A0",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "8A129E6C-0EE8-4A0C-BE4D-E39FC20E6FCF",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "204EF323-59D9-44A5-B2C3-34C70E166083",
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
                          "id" : "1784FCE6-ED96-4FBA-B5F3-92C6B2A9947A",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "6BF4122F-1AE9-44BB-B66C-56BE83D975FF",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "1A586449-9EAC-4269-B59E-AF37005F17D7",
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
              "id" : "79970D7A-5AD2-4331-A1CB-C44D4C1FC0B4",
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
                "F3689262-D299-43FA-9C64-C922E2ACAB15",
                "88ED8282-A252-4459-B9AA-7B0E1157355B"
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
                      "id" : "6C3CFB88-BD4C-43A2-9481-B548952645EE",
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
                      "id" : "A990EE87-103D-49AE-B28A-804E8591B917",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "DA456E20-B800-4148-98A9-E3BE3B3EFB43",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "AD83C426-F18C-4D34-BD37-14FF337FEACB",
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
                      "id" : "DF4310F3-2561-4D7F-8C25-363C1D8E879E",
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
                      "id" : "5B424C1D-5D06-44B5-8155-3FA6E931A4C7",
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
                                "F3689262-D299-43FA-9C64-C922E2ACAB15"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "F3689262-D299-43FA-9C64-C922E2ACAB15"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "F3689262-D299-43FA-9C64-C922E2ACAB15"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "E1C47A43-8A9C-4D63-A00F-C754F7CC8745",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "F3689262-D299-43FA-9C64-C922E2ACAB15"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "EF01D3B4-5FAC-450B-8CBA-6281BE1FD091",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "E6907715-6C1A-42EB-A1B1-45EEE32E7BC3",
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
                                  "id" : "2AAE4324-1BD0-4DE6-88BE-7F1D74381864",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "3C1FCA2D-0DAA-4DA7-BB0F-AC6F6858BA44",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "8FE55074-818F-4AC2-82EF-AE7064154006",
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
                          "id" : "5C6D3955-ACB8-408D-9042-9FCC1375AA67",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "A80508FE-9990-4B9E-ADCC-5E73839AE4AB",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "33012388-01E5-4368-B421-659C4E22DACD",
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
              "id" : "129B6B25-83CA-4391-A32F-EF8B019D7D80",
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
                "88ED8282-A252-4459-B9AA-7B0E1157355B"
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
                      "id" : "5582B714-775D-4A4F-BF36-1670A79D2737",
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
                      "id" : "812D5B98-9AA2-49CA-8620-7F16C40DEE6A",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "39439195-AA29-40DE-93E2-0F3416FC23C3",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "ADA1770C-9F4C-45E3-9BD9-973627459F4A",
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
                      "id" : "11D589F9-43B3-4964-A003-D7DA959ABA9D",
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
                      "id" : "6F4ABB12-D960-45D6-8B89-759885C46E1A",
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
                                "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "38F5152B-E723-4063-B265-68EBD71A4BC2",
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "0A6F97F9-927A-49C7-A74E-48175ADF7FCF"
                                      ],
                                      "children" : [

                                      ],
                                      "id" : "5E3AA826-7D12-48C1-8E20-D7C4BD23FE22",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "C5BABDF7-2C3D-4342-BF6A-FCC502F58CE7",
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
                                  "id" : "8375282F-A1BD-4759-9512-28D4A0353C2B",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "0BCB9968-024E-4E7B-9669-C9438E659467",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "BAECA42C-FFDB-4FA7-A677-AC52C4AC3B3C",
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
                          "id" : "C1652800-B28D-4B1E-A2D1-1C4194691271",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "D54AA874-AC7A-4611-A0A9-743DEF703D3E",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "35FF3BC4-7976-4CE4-BEEB-A2BF8A773B55",
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
              "id" : "278B015A-4909-46B2-8A6C-00D4990A6D70",
              "name" : "TestGenericChildClass",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "6F9E6E63-21F8-43FB-8F2C-F1485496D305",
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "3E1D335E-0685-4188-BDBA-088773242878",
      "name" : "CocoaPods",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "id" : "FA325601-3FF9-4E5B-A668-C877B4F7A008",
  "scope" : "root",
  "tags" : [

  ]
}
"""

private let warning = """
AST for SnapKit has invalid format: ASTScopeImpl: resorting to startingScope hack, file: /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide.swift
because location is within an inactive clause
'NSLayoutGuide' loc: /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide.swift:36:46
starting context:
0x106864e70 Module name=SnapKit
0x10c060f90 FileUnit file="/Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide.swift"
  0x10c061f08 TypeAliasDecl name=ConstraintLayoutGuide


<unknown>:0: error: fatal error encountered during compilation; please file a bug report with your project and the crash log
<unknown>:0: note: A lookup was attempted into an inactive clause
Stack dump:
0.    Program arguments: /Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -frontend -dump-ast /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/Constraint.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintAttributes.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintConfig.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintConstantTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintDescription.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintDirectionalInsets.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintDirectionalInsetTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintDSL.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintInsets.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintInsetTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintItem.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide+Extensions.swift -primary-file /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide.swift -primary-file /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuideDSL.swift -primary-file /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutSupport.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutSupportDSL.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMaker.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMakerEditable.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMakerExtendable.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMakerFinalizable.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMakerPriortizable.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMakerRelatable.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintMultiplierTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintOffsetTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintPriority.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintPriorityTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintRelatableTarget.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintRelation.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintView+Extensions.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintView.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintViewDSL.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/Debugging.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/LayoutConstraint.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/LayoutConstraintItem.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/Typealiases.swift /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/UILayoutSupport+Extensions.swift -serialize-diagnostics-path /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/Objects-normal/arm64/ConstraintLayoutGuide.dia -serialize-diagnostics-path /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/Objects-normal/arm64/ConstraintLayoutGuideDSL.dia -serialize-diagnostics-path /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/Objects-normal/arm64/ConstraintLayoutSupport.dia -target arm64-apple-ios10.0 -Xllvm -aarch64-use-tbi -enable-objc-interop -sdk /Applications/Xcode-beta.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS14.2.sdk -I /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Products/Debug-iphoneos/SnapKit -F /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Products/Debug-iphoneos/SnapKit -enable-testing -g -import-underlying-module -module-cache-path /Users/stephanlerner/Library/Developer/Xcode/DerivedData/ModuleCache.noindex -swift-version 5 -enforce-exclusivity=checked -Onone -D DEBUG -D COCOAPODS -serialize-debugging-options -Xcc -working-directory -Xcc /Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods -enable-anonymous-context-mangled-names -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/swift-overrides.hmap -Xcc -iquote -Xcc /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/SnapKit-generated-files.hmap -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/SnapKit-own-target-headers.hmap -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/SnapKit-all-non-framework-target-headers.hmap -Xcc -ivfsoverlay -Xcc /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/all-product-headers.yaml -Xcc -iquote -Xcc /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/SnapKit-project-headers.hmap -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Products/Debug-iphoneos/SnapKit/include -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/DerivedSources-normal/arm64 -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/DerivedSources/arm64 -Xcc -I/Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/DerivedSources -Xcc -DPOD_CONFIGURATION_DEBUG=1 -Xcc -DDEBUG=1 -Xcc -DCOCOAPODS=1 -Xcc -ivfsoverlay -Xcc /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Build/Intermediates.noindex/Pods.build/Debug-iphoneos/SnapKit.build/unextended-module-overlay.yaml -target-sdk-version 14.2 -module-name SnapKit -o - -o - -o - -index-store-path /Users/stephanlerner/Library/Developer/Xcode/DerivedData/SnapKitCocoaPods-afuzikomyijqoohihqtyxxhpwkrd/Index/DataStore -index-system-modules
1.    Apple Swift version 5.3.1 (swiftlang-1200.0.41 clang-1200.0.32.8)
2.    While evaluating request UnderlyingTypeRequest(SnapKit.(file).ConstraintLayoutGuide@/Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide.swift:36:22)
3.    While resolving type NSLayoutGuide at [/Users/stephanlerner/Desktop/SwiftArchitekkt/Resources/SnapKitCocoaPods/Pods/SnapKit/Source/ConstraintLayoutGuide.swift:36:46 - line:36:46] RangeText=""
4.    While evaluating request UnqualifiedLookupRequest(looking up 'NSLayoutGuide' from 0x10c061f08 TypeAliasDecl name=ConstraintLayoutGuide with options { TypeLookup })
0  swift                    0x000000010489bc15 llvm::sys::PrintStackTrace(llvm::raw_ostream&) + 37
1  swift                    0x000000010489c332 SignalHandler(int) + 610
2  libsystem_platform.dylib 0x00007fff20414d7d _sigtramp + 29
3  libsystem_platform.dylib 0x00007ffeefbfae48 _sigtramp + 18446744072895750376
4  libsystem_c.dylib        0x00007fff20322720 abort + 120
5  swift                    0x00000001000a47a1 swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*)::$_1::__invoke(void*, std::__1::basic_string<char, std::__1::char_traits<char>, std::__1::allocator<char> > const&, bool) + 1137
6  swift                    0x00000001047ff1a7 llvm::report_fatal_error(llvm::Twine const&, bool) + 279
7  swift                    0x00000001047ff082 llvm::report_fatal_error(char const*, bool) + 50
8  swift                    0x0000000101246f12 swift::ast_scope::ASTScopeImpl::findStartingScopeForLookup(swift::SourceFile*, swift::DeclNameRef, swift::SourceLoc, swift::DeclContext const*) + 1810
9  swift                    0x00000001013dd717 (anonymous namespace)::UnqualifiedLookupFactory::lookInASTScopes() + 263
10 swift                    0x00000001013dc8e1 swift::UnqualifiedLookupRequest::evaluate(swift::Evaluator&, swift::UnqualifiedLookupDescriptor) const + 1265
11 swift                    0x000000010139a3f3 swift::SimpleRequest<swift::UnqualifiedLookupRequest, swift::LookupResult (swift::UnqualifiedLookupDescriptor), (swift::RequestFlags)25>::evaluateRequest(swift::UnqualifiedLookupRequest const&, swift::Evaluator&) + 35
12 swift                    0x00000001000e2573 llvm::Expected<swift::UnqualifiedLookupRequest::OutputType> swift::Evaluator::getResultUncached<swift::UnqualifiedLookupRequest>(swift::UnqualifiedLookupRequest const&) + 755
13 swift                    0x00000001000e20ee swift::UnqualifiedLookupRequest::OutputType swift::evaluateOrDefault<swift::UnqualifiedLookupRequest>(swift::Evaluator&, swift::UnqualifiedLookupRequest, swift::UnqualifiedLookupRequest::OutputType) + 206
14 swift                    0x0000000100f95451 swift::TypeChecker::lookupUnqualifiedType(swift::DeclContext*, swift::DeclNameRef, swift::SourceLoc, swift::OptionSet<swift::NameLookupFlags, unsigned int>) + 225
15 swift                    0x000000010101ff6a resolveIdentTypeComponent(swift::TypeResolution, llvm::ArrayRef<swift::ComponentIdentTypeRepr*>, swift::TypeResolutionOptions) + 698
16 swift                    0x000000010101f9bf swift::TypeChecker::resolveIdentifierType(swift::TypeResolution, swift::IdentTypeRepr*, swift::TypeResolutionOptions) + 191
17 swift                    0x000000010102282f (anonymous namespace)::TypeResolver::resolveType(swift::TypeRepr*, swift::TypeResolutionOptions) + 271
18 swift                    0x00000001010224e6 swift::TypeResolution::resolveType(swift::TypeRepr*, swift::TypeResolutionOptions) + 566
19 swift                    0x0000000100f31a66 swift::UnderlyingTypeRequest::evaluate(swift::Evaluator&, swift::TypeAliasDecl*) const + 870
20 swift                    0x0000000101296bda swift::UnderlyingTypeRequest::OutputType swift::evaluateOrDefault<swift::UnderlyingTypeRequest>(swift::Evaluator&, swift::UnderlyingTypeRequest, swift::UnderlyingTypeRequest::OutputType) + 1242
21 swift                    0x00000001011e44bc swift::ASTVisitor<(anonymous namespace)::PrintDecl, void, void, void, void, void, void>::visit(swift::Decl*) + 7532
22 swift                    0x00000001011e38b9 swift::ASTVisitor<(anonymous namespace)::PrintDecl, void, void, void, void, void, void>::visit(swift::Decl*) + 4457
23 swift                    0x00000001011e72f2 swift::SourceFile::dump(llvm::raw_ostream&) const + 658
24 swift                    0x00000001000a049e swift::performFrontend(llvm::ArrayRef<char const*>, char const*, void*, swift::FrontendObserver*) + 8718
25 swift                    0x00000001000242c1 main + 1265
26 libdyld.dylib            0x00007fff203eb591 start + 1
27 libdyld.dylib            0x000000000000007f start + 18446603339975183087
<unknown>:0: error: unable to execute command: Abort trap: 6
<unknown>:0: error: compile command failed due to signal 6 (use -v to see invocation)

"""
