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
              "id" : "C13AC44E-26F9-4E29-88D5-2016B8BD8EEC",
              "scope" : "import_decl",
              "tags" : [
                "Cocoa"
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
                          "id" : "73E977F8-3B92-4A66-899B-C8BC34FF7C1A",
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
                                  "id" : "5943F4CF-62A6-4ED4-B8C1-D90A0335F830",
                                  "scope" : "component",
                                  "tags" : [
                                    "NSWindow",
                                    "bind=AppKit.(file).NSWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "id" : "D3666497-9660-4330-81D3-FFF742E2BDFB",
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "id" : "19510BDC-0B22-48E1-82C3-AFFD7C6B0651",
                          "scope" : "type_implicitly_unwrapped_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "id" : "039AFC97-F61B-41C1-B33E-247D25DDCDDD",
                      "scope" : "pattern_typed",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "BA02BF51-5F2C-477A-8005-55E3E6619E56",
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "id" : "2C6F338F-270D-4BA6-BE61-AFB0FBDD3F85",
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
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
                          "id" : "0235A003-DCEE-424D-B770-7C07CE7F9A63",
                          "name" : "AppDelegate.window.self:36369CC1-923A-427E-9328-C7BEF2C17158",
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
                          "id" : "0D91963A-0EC6-40CD-91B3-2AB050988AAD",
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
                                      "id" : "6D445966-D7D0-4CBA-864B-CC5F70EBF361",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "8C50ACFC-B3EC-4902-8999-A6EF40602247",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "CD928EE1-5C8F-48E7-B1D4-443D4A8EA620",
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "08581C78-43DF-4C88-A902-75BFAA6B1199",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "CFF5FFB9-A462-4F94-82F5-6DCE1C9EF937",
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

                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "id" : "3EC0AA04-2257-444A-9A2A-9428B884DAE2",
                          "name" : "AppDelegate.window.self:37CD079A-B62F-4D22-940C-7AFF177F7F8C",
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
                              "id" : "C2D4DA82-5E7B-47E7-85A8-B9A6DC13E359",
                              "name" : "AppDelegate.window.value",
                              "scope" : "parameter",
                              "tags" : [
                                "interface"
                              ]
                            }
                          ],
                          "id" : "3811B78F-8F62-43E7-917D-5C6D8EF2C382",
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
                                      "id" : "E0312A2C-1159-433F-B91C-DEDB503A5C19",
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "C50C440D-37B6-40E7-B52E-677AD4727BC4",
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                },
                                {
                                  "arcs" : [

                                  ],
                                  "children" : [

                                  ],
                                  "id" : "CB4F3D1A-84F8-4890-9A77-4BE8EB5E4DA2",
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "329FEF99-7AE7-4E10-8842-65AC22E1004B",
                              "scope" : "assign_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "A6C54B6D-4D2A-45CF-A3B2-B53AB79B0961",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "F44752A6-3633-4A28-B1DF-33920E501042",
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
                          "id" : "8D7C7603-6A8E-4EE1-B914-4007466DEC21",
                          "name" : "AppDelegate.window.self:2C886342-00D7-4A57-BE29-D6EAA90DB55A",
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
                          "id" : "4ECF7A52-4498-4F94-86B6-735513888125",
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
                                          "id" : "CFCCE528-F520-4C5B-AEC0-689A7CCDF3E1",
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "id" : "BF3A6776-DE5A-49CA-8F1A-FBF1BFABF05A",
                                      "scope" : "member_ref_expr",
                                      "tags" : [
                                        "direct_to_impl",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "BE01640C-037E-4D78-9C3E-88083C981C83",
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "13C6826F-A5B5-487D-9593-F4D863606FF2",
                              "scope" : "yield_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "id" : "C27DE5D4-CDB2-4C43-9FB9-A47178F90938",
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "CA12D074-B62D-4CC7-B77C-FA2F60D27E03",
                      "scope" : "accessor_decl",
                      "tags" : [
                        "_modify_for=window",
                        "access=internal",
                        "implicit",
                        "interface"
                      ]
                    }
                  ],
                  "id" : "96C6D8D4-E154-4E61-A331-B66B11C6C48E",
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "1E5C36F8-3039-4EAD-BD30-0CD5E6E69669",
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

                          ],
                          "children" : [

                          ],
                          "id" : "A3D41519-95D2-4F0C-B467-B23B4A3EF6D6",
                          "name" : "AppDelegate.applicationDidFinishLaunching(_:).aNotification",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "AE352F12-A8F4-4431-B40E-F73B0E48940D",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "684AD34D-CCC3-49AB-A0AC-5E625B953C4C",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "BEF4139E-746A-46A2-9EBD-788F96C271FC",
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

                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "B6C45057-38B9-40BB-80B7-24E64080DAFE",
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

                          ],
                          "children" : [

                          ],
                          "id" : "29E08A41-74CC-4A28-90C8-42CE47FD3108",
                          "name" : "AppDelegate.applicationWillTerminate(_:).aNotification",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "id" : "1D97E923-4328-4E8B-947D-5006F5262B0D",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "0CAF9D4A-04B0-475E-893F-81FC99FA35CB",
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "id" : "736DE2F7-4602-4712-9E00-D2C75CDD3A04",
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
                      "id" : "BDB700DF-8B4E-491A-BA66-4438D099F3B2",
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
                      "id" : "707D2AA0-2750-4B0B-A3CA-2950A9FE6F99",
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "id" : "F995AA89-FD4B-4983-BF98-2C59792E2C5B",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "A6A4945A-F438-4DBB-B131-91C8D32D67A8",
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
                      "id" : "F51C9B35-C77D-4A38-AD2C-43BBEDABFC9E",
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
                      "id" : "5B92943A-DA7C-4A7D-95A9-CE89ED5BB893",
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
                                      "id" : "5FAD23B0-8121-4563-9BB0-E27890192C1F",
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
                                      "id" : "6C961B6A-C3D4-4F7C-84F7-746EFC5C06D4",
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "id" : "1FD43437-130B-4FFE-8C56-5D5CA079564E",
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
                                  "id" : "1F4B8499-2028-4A61-85A7-947CDA027589",
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "id" : "7860B37A-9E2F-4A18-B7A6-52564C3E02CF",
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "id" : "219BA5AC-1E9E-442B-838E-F5C33C7695BA",
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
                          "id" : "2914817F-435C-4F7C-A53E-3959861AA1DA",
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "id" : "CB9917D0-1F57-4A44-86B0-D6347251B0A8",
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "id" : "C4F8B86F-778E-4944-AF91-194B71375427",
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
              "id" : "E359F832-81AB-4090-AB8C-5F6D298D4477",
              "name" : "AppDelegate",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "id" : "7DFACF4E-1F82-489F-AA28-17F95F59E2DA",
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "id" : "8F566333-9B1D-4504-A56B-6C79F8101D41",
      "name" : "MacOSSDK",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "id" : "E4632C8F-2E71-4551-A578-22D05F3545A5",
  "scope" : "root",
  "tags" : [

  ]
}
"""

}
