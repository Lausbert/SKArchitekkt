//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct MacOSProject: Ressource {

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
              "identifier" : "B59C0F4F-73AE-439F-B43B-8919EB8832A4",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "Cocoa"
              ]
            },
            {
              "arcs" : [
                "7ABBB333-33C9-4DBF-9E81-11C7336E43E7",
                "057E83BE-2DD9-43C4-9816-B4E267A347BA",
                "92065331-316B-413E-BC24-EC80417ECADD"
              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "A8F934B3-6E64-4300-8D04-65E0A2391045"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "A8F934B3-6E64-4300-8D04-65E0A2391045"
                          ],
                          "children" : [

                          ],
                          "identifier" : "70B93B4E-BFEF-4214-AC69-C96AFB89A977",
                          "isRoot" : false,
                          "scope" : "pattern_named",
                          "tags" : [
                            "window"
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
                                  "identifier" : "0BC44973-86F1-4494-88C0-96965D182D8A",
                                  "isRoot" : false,
                                  "scope" : "component",
                                  "tags" : [
                                    "NSWindow",
                                    "bind=AppKit.(file).NSWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "identifier" : "1833A566-146F-4ECB-A200-DA236964CD31",
                              "isRoot" : false,
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "identifier" : "A575145D-B76E-4118-83A3-FB92BDDD0F0C",
                          "isRoot" : false,
                          "scope" : "type_implicitly_unwrapped_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "5A5C5660-9783-4626-84D9-8528ABE309D0",
                      "isRoot" : false,
                      "scope" : "pattern_typed",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [
                        "A8F934B3-6E64-4300-8D04-65E0A2391045"
                      ],
                      "children" : [

                      ],
                      "identifier" : "47656BFB-FBC6-4B73-B5DE-50B689D6CE02",
                      "isRoot" : false,
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "identifier" : "99BA2D53-D0D9-4FD5-81E8-16DB0F780912",
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "A8F934B3-6E64-4300-8D04-65E0A2391045"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "A8F934B3-6E64-4300-8D04-65E0A2391045"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "0AE8D81F-AF95-4B81-8112-73E3C0BCF268",
                          "isRoot" : false,
                          "name" : "AppDelegate.window.self:6DF13DD5-5BBD-4F7A-B46D-7D4BAB347B5C",
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
                          "identifier" : "AE4A9119-F7CE-43CF-B5AA-AB98564A1D91",
                          "isRoot" : false,
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
                                    "A8F934B3-6E64-4300-8D04-65E0A2391045"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "097D5762-F1BC-4F29-81A9-E860AA6E2A11",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "24FA1704-A64A-49C4-9D28-D8679821734F",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "1CCC5A89-6248-4353-B49A-78F98E7F0E00",
                              "isRoot" : false,
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "identifier" : "6E57C0D7-FD1A-4221-B94D-6D637566054E",
                          "isRoot" : false,
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "CD0902B8-AB0F-438A-8401-5FBCEEF9519C",
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "get_for=window",
                        "implicit",
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [
                        "A8F934B3-6E64-4300-8D04-65E0A2391045"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "0B669421-9F74-4745-BA08-68E5E8C72404",
                          "isRoot" : false,
                          "name" : "AppDelegate.window.self:5D5AB702-49E2-49B2-92BB-D03F7E062494",
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
                                "A8F934B3-6E64-4300-8D04-65E0A2391045"
                              ],
                              "children" : [

                              ],
                              "identifier" : "48DAA5A1-3AC7-44B8-A900-201223091CA8",
                              "isRoot" : false,
                              "name" : "AppDelegate.window.value",
                              "scope" : "parameter",
                              "tags" : [
                                "interface"
                              ]
                            }
                          ],
                          "identifier" : "155C92AA-6185-48EA-9B7C-40FD923F3717",
                          "isRoot" : false,
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
                                    "A8F934B3-6E64-4300-8D04-65E0A2391045"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "58123A2E-216E-47EB-8C2C-5B8DC8BBE22B",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "0483262D-0F24-4F0A-B18E-2A219D6A01A0",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                },
                                {
                                  "arcs" : [
                                    "A8F934B3-6E64-4300-8D04-65E0A2391045"
                                  ],
                                  "children" : [

                                  ],
                                  "identifier" : "03A0C280-7F5D-489A-BF92-EA288E68D5BC",
                                  "isRoot" : false,
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "3B3D62E9-A162-46CA-A9F9-27CB45667609",
                              "isRoot" : false,
                              "scope" : "assign_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "identifier" : "A3E6C6B0-9C4C-401D-9DF2-70C60A1C7D90",
                          "isRoot" : false,
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "48466BBE-5216-47DA-A975-D2D6BD431749",
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "access=internal",
                        "implicit",
                        "interface",
                        "set_for=window"
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
                          "identifier" : "E1C99D6A-F71E-4C77-8D7D-CC64B9813163",
                          "isRoot" : false,
                          "name" : "AppDelegate.window.self:8F416037-4FC2-4A5C-A449-FE21124CA198",
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
                          "identifier" : "747D0F40-E690-49E6-B946-199687201A16",
                          "isRoot" : false,
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
                                    "A8F934B3-6E64-4300-8D04-65E0A2391045"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "A8F934B3-6E64-4300-8D04-65E0A2391045"
                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "identifier" : "659360D7-CB96-4B21-AD08-E3635A5FCE38",
                                          "isRoot" : false,
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "identifier" : "6904D1C6-138E-430B-85E1-D24777974AC1",
                                      "isRoot" : false,
                                      "scope" : "member_ref_expr",
                                      "tags" : [
                                        "direct_to_impl",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "5EBC84A1-C3D2-4CD1-B832-640C82605E64",
                                  "isRoot" : false,
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "BE9B437E-CF0B-4D86-A953-0803ED718ECB",
                              "isRoot" : false,
                              "scope" : "yield_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "identifier" : "242F7C7A-4412-4F3D-98B7-82EE0501DC3F",
                          "isRoot" : false,
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "52DE41F7-66A4-4BDE-8038-F1F199F50F65",
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "identifier" : "8BC8776F-BD2F-4D4F-9D21-49BA49E8552F",
                  "isRoot" : false,
                  "name" : "AppDelegate.window",
                  "scope" : "var_decl",
                  "tags" : [
                    "access=internal",
                    "interface",
                    "readImpl=stored",
                    "readWriteImpl=stored",
                    "writeImpl=stored"
                  ]
                },
                {
                  "arcs" : [
                    "D95DFBEA-33DC-49CC-8D87-FE22172517EE"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "6454B138-E162-4AF9-A9C0-270C0CAC1727",
                      "isRoot" : false,
                      "name" : "AppDelegate.applicationDidFinishLaunching(_:).self",
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
                            "D95DFBEA-33DC-49CC-8D87-FE22172517EE"
                          ],
                          "children" : [

                          ],
                          "identifier" : "4A18CEB5-8BE9-4992-8F8B-21E291916486",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationDidFinishLaunching(_:).aNotification",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "1A5AAF0D-D075-4E26-8AE8-AFFA8DF7253F",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "8D59894C-060D-4957-9482-5E5F20F27BE5",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "E4A402C1-8B5B-4214-8C49-2B74EE991C9A",
                  "isRoot" : false,
                  "name" : "AppDelegate.applicationDidFinishLaunching(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "D95DFBEA-33DC-49CC-8D87-FE22172517EE"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "B227F0C3-71F7-4BB2-BCA1-6CBEFBCB6520",
                      "isRoot" : false,
                      "name" : "AppDelegate.applicationWillTerminate(_:).self",
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
                            "D95DFBEA-33DC-49CC-8D87-FE22172517EE"
                          ],
                          "children" : [

                          ],
                          "identifier" : "2A387535-9B37-425A-A98B-BABC12C22980",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillTerminate(_:).aNotification",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "F07EF048-9438-4882-8911-682C4D71A6EB",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "334E3226-FF22-4A13-8DD3-95C76665F301",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "6489E9E0-CCD8-4B14-BD8F-92693D5C9808",
                  "isRoot" : false,
                  "name" : "AppDelegate.applicationWillTerminate(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
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
                      "identifier" : "5561581D-CF97-49EF-A7CC-EAFD16F4033F",
                      "isRoot" : false,
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
                      "identifier" : "B5A965D1-2A77-42D6-A8E3-2AA1F1301716",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "DC3AB5D0-651D-441B-B6D6-98A1F1EC6FCC",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "7E9E3587-C940-4B00-A774-DECE4C5151B7",
                  "isRoot" : false,
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
                    "7ABBB333-33C9-4DBF-9E81-11C7336E43E7"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "8EEB1804-EE66-49B4-93CE-7643F270C593",
                      "isRoot" : false,
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
                      "identifier" : "C705ED57-2DCF-4470-93AE-C293CE61217F",
                      "isRoot" : false,
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
                                "057E83BE-2DD9-43C4-9816-B4E267A347BA"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "057E83BE-2DD9-43C4-9816-B4E267A347BA"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "057E83BE-2DD9-43C4-9816-B4E267A347BA"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "947BF0C1-1587-433B-980C-4D82B6B5F0FF",
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "057E83BE-2DD9-43C4-9816-B4E267A347BA"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "EB4E8488-7B45-4B48-816D-25DC9DF800D1",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "B138D478-BF73-4B2D-BB86-68BCDB86F90B",
                                  "isRoot" : false,
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
                                  "identifier" : "A8FF3B9B-64F0-454E-B539-B4B6BC042FB8",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "E692B235-7F66-40D9-B2EB-45F0747F7667",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "0D8F0C12-3C31-430D-8BB6-50EECFCFE953",
                          "isRoot" : false,
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
                          "identifier" : "15B9887D-9CC9-49F8-A8BF-6B2D1061F02A",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "F5E79292-9335-46FA-A9F0-8BA7EBB1BBCC",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "A7F67C4E-0CA8-4177-9116-B8562113CE15",
                  "isRoot" : false,
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
              "identifier" : "DDDA0573-ED0E-4B81-9A77-A13E89487C10",
              "isRoot" : false,
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "A135E302-25B5-4F0A-B7B3-EFCCA9645662",
          "isRoot" : false,
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "identifier" : "13F7F54B-5713-4AAF-8D2F-A084690C5C21",
      "isRoot" : false,
      "name" : "MacOSSDK",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "identifier" : "2659D0D5-74CC-4DD8-80F8-1BB5C22E322A",
  "isRoot" : true,
  "scope" : "root",
  "tags" : [

  ]
}
"""

}
