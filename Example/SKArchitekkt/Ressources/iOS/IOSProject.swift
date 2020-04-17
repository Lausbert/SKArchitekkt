//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct IOSProject: Ressource {

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
              "identifier" : "1286EDAC-2EAB-43A4-B9DC-CAEA6A61A748",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "arcs" : [
                "B8626C36-0AF3-4EFC-9AB0-D7391A698E17",
                "B916DE9D-1D79-4387-89C2-11989456AC9E"
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
                      "identifier" : "8AD06AA2-D208-47FF-B790-CE192D334EE1",
                      "isRoot" : false,
                      "name" : "ViewController.viewDidLoad().self",
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
                      "identifier" : "3263317F-0EAB-4138-AD1D-9B5ED3552764",
                      "isRoot" : false,
                      "scope" : "parameter_list",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [
                        "79A370CD-86A4-4F33-98F3-EC8042796C5C"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "79A370CD-86A4-4F33-98F3-EC8042796C5C"
                          ],
                          "children" : [
                            {
                              "arcs" : [
                                "B916DE9D-1D79-4387-89C2-11989456AC9E",
                                "79A370CD-86A4-4F33-98F3-EC8042796C5C"
                              ],
                              "children" : [

                              ],
                              "identifier" : "01DD6F15-FE54-4954-8096-D552CDBFBAB8",
                              "isRoot" : false,
                              "scope" : "declref_expr",
                              "tags" : [
                                "function_ref=single"
                              ]
                            },
                            {
                              "arcs" : [
                                "B916DE9D-1D79-4387-89C2-11989456AC9E"
                              ],
                              "children" : [

                              ],
                              "identifier" : "187F5FC1-84E8-45F6-BCBF-53488CD8D294",
                              "isRoot" : false,
                              "scope" : "super_ref_expr",
                              "tags" : [

                              ]
                            }
                          ],
                          "identifier" : "F2EC8B92-2876-4874-B5BD-C1BDB6AA4A8E",
                          "isRoot" : false,
                          "scope" : "dot_syntax_call_expr",
                          "tags" : [
                            "nothrow",
                            "super"
                          ]
                        },
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "60847C64-BBEA-4ABB-96EC-8510434668DB",
                          "isRoot" : false,
                          "scope" : "tuple_expr",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "6B65897A-6CBA-410B-9AD9-011F03F89224",
                      "isRoot" : false,
                      "scope" : "call_expr",
                      "tags" : [
                        "arg_labels=",
                        "nothrow"
                      ]
                    }
                  ],
                  "identifier" : "3A3D2FE1-FCDE-46DE-8BEC-055895E0D109",
                  "isRoot" : false,
                  "name" : "ViewController.viewDidLoad()",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "dynamic",
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
                      "identifier" : "916B9193-F292-48DD-A5D5-2C0EBE74033A",
                      "isRoot" : false,
                      "name" : "ViewController.deinit.self",
                      "scope" : "parameter",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "D30B920F-6DC4-4CC1-BBE7-6C0731F43046",
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
                      "identifier" : "57DA5B59-8924-478B-BF16-C11C23F9BC2E",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "E4A389F1-710A-402A-B8CD-BCC3111EDA62",
                  "isRoot" : false,
                  "name" : "ViewController.deinit",
                  "scope" : "destructor_decl",
                  "tags" : [
                    "access=internal",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "B8626C36-0AF3-4EFC-9AB0-D7391A698E17",
                    "BFFBEF68-E549-4B12-AB4A-5C85F6E2186D",
                    "67B5D44D-74B3-43D1-BB38-A038016B8961"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "5E7EDBAD-BD1A-4AD2-9B23-57A58ED48F9C",
                      "isRoot" : false,
                      "name" : "ViewController.init(nibName:bundle:).self",
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
                            "BFFBEF68-E549-4B12-AB4A-5C85F6E2186D"
                          ],
                          "children" : [

                          ],
                          "identifier" : "19994230-9FFE-4666-9539-50F9FD5CE093",
                          "isRoot" : false,
                          "name" : "ViewController.init(nibName:bundle:).nibNameOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=nibName",
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [
                            "67B5D44D-74B3-43D1-BB38-A038016B8961"
                          ],
                          "children" : [

                          ],
                          "identifier" : "E67FAD91-311E-48D2-A8A9-E8215CDF10B4",
                          "isRoot" : false,
                          "name" : "ViewController.init(nibName:bundle:).nibBundleOrNil",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=bundle",
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "477F5A8B-5B89-4D75-8AFA-9073F01734F7",
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
                                "B916DE9D-1D79-4387-89C2-11989456AC9E"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "BFFBEF68-E549-4B12-AB4A-5C85F6E2186D",
                                    "67B5D44D-74B3-43D1-BB38-A038016B8961",
                                    "B916DE9D-1D79-4387-89C2-11989456AC9E"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "B916DE9D-1D79-4387-89C2-11989456AC9E",
                                        "BFFBEF68-E549-4B12-AB4A-5C85F6E2186D",
                                        "67B5D44D-74B3-43D1-BB38-A038016B8961"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "41E5F6B1-D5CB-4850-AEA5-20C85EBDEE31",
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "B916DE9D-1D79-4387-89C2-11989456AC9E"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "5FB1F662-F6E5-4EFB-982D-B554CC7475B7",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "1FCA76A9-59CA-4064-9036-BF2532D73261",
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
                                    "BFFBEF68-E549-4B12-AB4A-5C85F6E2186D",
                                    "67B5D44D-74B3-43D1-BB38-A038016B8961"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "BFFBEF68-E549-4B12-AB4A-5C85F6E2186D"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "912B5155-932F-47E1-A34F-8EA269E0FED9",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "67B5D44D-74B3-43D1-BB38-A038016B8961"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "8F38E0B8-77C5-4A2B-B0EF-7BB7D0D11DA4",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "B5F94415-03AA-4801-81C0-6D2875918090",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    ",bundle",
                                    "implicit",
                                    "names=nibName"
                                  ]
                                }
                              ],
                              "identifier" : "3E8E9C07-D5A6-4A1F-AFBD-54695C982694",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=nibName:bundle:",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "94EA67E5-D8D4-4EEE-9E03-BF787D0FA6C9",
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
                          "identifier" : "76F20811-462D-4C1A-9DBB-5104976035AB",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "3627DDC8-97C2-4F4B-940B-875A816C5B07",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "7D014592-406E-41EC-8425-AFBC5DD087D9",
                  "isRoot" : false,
                  "name" : "ViewController.init(nibName:bundle:)",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "implicit",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "B8626C36-0AF3-4EFC-9AB0-D7391A698E17",
                    "FDA74F49-19B8-413C-B895-45AA268975C8"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "59ECE9A3-A6AC-4AD9-A3D6-5A29401EFE38",
                      "isRoot" : false,
                      "name" : "ViewController.init(coder:).self",
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
                            "FDA74F49-19B8-413C-B895-45AA268975C8"
                          ],
                          "children" : [

                          ],
                          "identifier" : "4C286BA1-EE48-4FFA-9C60-2B39EF9A6FB1",
                          "isRoot" : false,
                          "name" : "ViewController.init(coder:).coder",
                          "scope" : "parameter",
                          "tags" : [
                            "apiName=coder",
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "EDB1A64A-C4BC-49B3-9CA2-CAB447EBCC3A",
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
                                "B916DE9D-1D79-4387-89C2-11989456AC9E"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "FDA74F49-19B8-413C-B895-45AA268975C8",
                                    "B916DE9D-1D79-4387-89C2-11989456AC9E"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "B916DE9D-1D79-4387-89C2-11989456AC9E",
                                        "FDA74F49-19B8-413C-B895-45AA268975C8"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "9BF9F378-9DC0-43CE-A54C-0E9A9EDA24B5",
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "B916DE9D-1D79-4387-89C2-11989456AC9E"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "20D86BB4-0386-48F6-825C-59BD7C013353",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "C0C1A40F-82D7-4853-BED7-00D6E02EB1ED",
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
                                    "FDA74F49-19B8-413C-B895-45AA268975C8"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "FDA74F49-19B8-413C-B895-45AA268975C8"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "A43D23D3-B440-4D17-9986-26D2F7883167",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "D7FB63AF-79E1-42B1-87CC-73CF1514B6AB",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit",
                                    "names=coder"
                                  ]
                                }
                              ],
                              "identifier" : "10CFB4BB-47D8-4A99-8319-6103A9813321",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=coder:",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "EBC93DC2-D48C-416B-B0C8-2CABE1EE0ABA",
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
                          "identifier" : "3C7C2C40-147E-453C-AEBD-AE1DE937854D",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "6E40ECA4-58F7-4B08-BA02-BB7DC472574B",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "98818441-549D-4077-B2DA-F2BF4E697384",
                  "isRoot" : false,
                  "name" : "ViewController.init(coder:)",
                  "scope" : "constructor_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "designated",
                    "dynamic",
                    "failable=Optional",
                    "implicit",
                    "interface",
                    "required"
                  ]
                }
              ],
              "identifier" : "CE69CE29-D762-47F4-89D2-856228B28700",
              "isRoot" : false,
              "name" : "ViewController",
              "scope" : "class_decl",
              "tags" : [
                "access=internal",
                "interface",
                "non-resilient"
              ]
            }
          ],
          "identifier" : "2B192A0B-5337-411D-A8CE-AF422290DE14",
          "isRoot" : false,
          "name" : "ViewControllerSourceFile",
          "scope" : "source_file",
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
              "identifier" : "B2A45B38-FEE5-4A28-A497-BB8BCAD8B85B",
              "isRoot" : false,
              "scope" : "import_decl",
              "tags" : [
                "UIKit"
              ]
            },
            {
              "arcs" : [
                "B49BBF2D-7B92-450F-B9A4-0855424D4FD4",
                "BE94500A-5704-4BE8-8878-4D9FDB8EBB45",
                "1FACD69F-80C3-411A-82C8-FB5D0E574A93"
              ],
              "children" : [
                {
                  "arcs" : [

                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                      ],
                      "children" : [
                        {
                          "arcs" : [
                            "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                          ],
                          "children" : [

                          ],
                          "identifier" : "1956B097-4CB8-4E81-A76E-FE96799CC2EE",
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
                                  "identifier" : "23B6CFD8-05D9-4675-83FF-B4679E7874E6",
                                  "isRoot" : false,
                                  "scope" : "component",
                                  "tags" : [
                                    "UIWindow",
                                    "bind=UIKit.(file).UIWindow",
                                    "id="
                                  ]
                                }
                              ],
                              "identifier" : "CB9244DE-3145-42AD-918C-5182F9F3E48C",
                              "isRoot" : false,
                              "scope" : "type_ident",
                              "tags" : [

                              ]
                            }
                          ],
                          "identifier" : "98980AE0-9CBB-493D-BD23-2AFB68E4BF3F",
                          "isRoot" : false,
                          "scope" : "type_optional",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "44220965-1F7C-404E-82A0-1D6DBDC452B4",
                      "isRoot" : false,
                      "scope" : "pattern_typed",
                      "tags" : [

                      ]
                    },
                    {
                      "arcs" : [
                        "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                      ],
                      "children" : [

                      ],
                      "identifier" : "7E760CE7-7B3E-4255-AB6A-2D60DD148A48",
                      "isRoot" : false,
                      "scope" : "nil_literal_expr",
                      "tags" : [
                        "implicit",
                        "initializer=**NULL**"
                      ]
                    }
                  ],
                  "identifier" : "D8D6F059-115C-482A-A71D-E52D41C736AA",
                  "isRoot" : false,
                  "scope" : "pattern_binding_decl",
                  "tags" : [
                    "Processed",
                    "init:"
                  ]
                },
                {
                  "arcs" : [
                    "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                  ],
                  "children" : [
                    {
                      "arcs" : [
                        "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "2CA86E33-F35F-4C27-B5A8-4C91DF0369A1",
                          "isRoot" : false,
                          "name" : "AppDelegate.window.self:6487E7EC-672E-4082-B656-9EDB79085B2B",
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
                          "identifier" : "356ABCF3-7A1A-4FD8-A0F1-C96506123CB0",
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
                                    "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "3F03EDE2-6899-4E9D-B420-C31A920A85F1",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "84D296C9-6169-40E3-8EF1-6380B6278D52",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "E77B3F1C-2221-45DF-8E20-97CCAD69F59A",
                              "isRoot" : false,
                              "scope" : "return_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "identifier" : "E46D4ECA-6221-4EDA-AC02-B0D4FF7A3E1F",
                          "isRoot" : false,
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "7E113709-180B-4E35-A3A3-F868D8584A45",
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "@objc",
                        "access=internal",
                        "get_for=window",
                        "implicit",
                        "interface"
                      ]
                    },
                    {
                      "arcs" : [
                        "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                      ],
                      "children" : [
                        {
                          "arcs" : [

                          ],
                          "children" : [

                          ],
                          "identifier" : "B3A17D04-A179-4FB9-B69E-1178804CBC68",
                          "isRoot" : false,
                          "name" : "AppDelegate.window.self:486834B8-EA5C-46AF-A553-2A660C05ED3C",
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
                                "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                              ],
                              "children" : [

                              ],
                              "identifier" : "46F44508-66FB-432E-9F10-7461E80C4A40",
                              "isRoot" : false,
                              "name" : "AppDelegate.window.value",
                              "scope" : "parameter",
                              "tags" : [
                                "interface"
                              ]
                            }
                          ],
                          "identifier" : "BF9D964A-F408-492D-958F-60C3B849179A",
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
                                    "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [

                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "BB281990-148B-44FC-ADC7-66F22253D928",
                                      "isRoot" : false,
                                      "scope" : "declref_expr",
                                      "tags" : [
                                        "function_ref=unapplied",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "18C45F2B-003A-4838-9011-A9C1DFDAD4AE",
                                  "isRoot" : false,
                                  "scope" : "member_ref_expr",
                                  "tags" : [
                                    "direct_to_storage",
                                    "implicit"
                                  ]
                                },
                                {
                                  "arcs" : [
                                    "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                                  ],
                                  "children" : [

                                  ],
                                  "identifier" : "CA3C48C2-C1B5-4702-8DDD-78257E66B983",
                                  "isRoot" : false,
                                  "scope" : "declref_expr",
                                  "tags" : [
                                    "function_ref=unapplied",
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "73839F01-8601-4A94-8860-97C2267778F2",
                              "isRoot" : false,
                              "scope" : "assign_expr",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "identifier" : "960734D2-4512-4EB1-8CC5-6FA45D3B6111",
                          "isRoot" : false,
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "83568FAD-BC12-4B91-8504-0A5240051E17",
                      "isRoot" : false,
                      "scope" : "accessor_decl",
                      "tags" : [
                        "@objc",
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
                          "identifier" : "077802E7-061D-4702-B4D9-A0A94769365D",
                          "isRoot" : false,
                          "name" : "AppDelegate.window.self:C693C91F-8281-4BE1-B6F8-DF4A547D31B4",
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
                          "identifier" : "25F4930D-518C-46B4-A88E-E591120627F4",
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
                                    "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "9E811BD3-15D8-463F-93C4-577E7877AF1B"
                                      ],
                                      "children" : [
                                        {
                                          "arcs" : [

                                          ],
                                          "children" : [

                                          ],
                                          "identifier" : "0ABA4826-40AF-4B37-9A26-F1B41DED83BA",
                                          "isRoot" : false,
                                          "scope" : "declref_expr",
                                          "tags" : [
                                            "function_ref=unapplied",
                                            "implicit"
                                          ]
                                        }
                                      ],
                                      "identifier" : "67FA8ADE-F220-4335-AC91-D1716EC4635B",
                                      "isRoot" : false,
                                      "scope" : "member_ref_expr",
                                      "tags" : [
                                        "direct_to_impl",
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "67A79D7B-EC3E-4069-9014-898D9ABC4AC0",
                                  "isRoot" : false,
                                  "scope" : "inout_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "F63DA871-96E3-40BA-BFF1-6A3EAF4C68BE",
                              "isRoot" : false,
                              "scope" : "yield_stmt",
                              "tags" : [
                                "implicit"
                              ]
                            }
                          ],
                          "identifier" : "FD4E5ABF-084A-4354-ABF4-00C73BEAEA59",
                          "isRoot" : false,
                          "scope" : "brace_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "1E43B0D0-DDCB-42BF-B63B-B4A776B1CE9D",
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
                  "identifier" : "A74F3FA9-533E-4D29-AECE-35E34A35BF0D",
                  "isRoot" : false,
                  "name" : "AppDelegate.window",
                  "scope" : "var_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface",
                    "readImpl=stored",
                    "readWriteImpl=stored",
                    "writeImpl=stored"
                  ]
                },
                {
                  "arcs" : [
                    "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E",
                    "5FDCCC85-22EF-4423-AD0C-725F85B9544D",
                    "83BF5C36-58D8-4D9F-B9D0-2ADA2DC26C7E",
                    "2205597A-F0EE-440C-95E3-5709C9004345"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "D7922B15-1489-4C73-9FF7-AD0D780B17A6",
                      "isRoot" : false,
                      "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).self",
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
                            "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "64035FD0-7046-4A00-8EB2-2EA73BCDE561",
                          "isRoot" : false,
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        },
                        {
                          "arcs" : [
                            "5FDCCC85-22EF-4423-AD0C-725F85B9544D",
                            "83BF5C36-58D8-4D9F-B9D0-2ADA2DC26C7E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "82DC195C-0C2D-4BA8-A37A-CD781C9EE247",
                          "isRoot" : false,
                          "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:).launchOptions",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "10E85F14-8E72-478A-9556-24CFB7235B57",
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

                              ],
                              "children" : [

                              ],
                              "identifier" : "BA79A027-BE47-450F-9646-7040B4C84A18",
                              "isRoot" : false,
                              "scope" : "component",
                              "tags" : [
                                "Bool",
                                "bind=Swift.(file).Bool",
                                "id="
                              ]
                            }
                          ],
                          "identifier" : "82A40D11-4839-478D-8B9A-CB8AD71E857B",
                          "isRoot" : false,
                          "scope" : "type_ident",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "5569FFEC-BF95-4425-A24F-04D87E45CB6D",
                      "isRoot" : false,
                      "scope" : "result",
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
                                "2205597A-F0EE-440C-95E3-5709C9004345"
                              ],
                              "children" : [

                              ],
                              "identifier" : "01DE3B7D-C168-460A-A7C7-B2CDA5BCB4FC",
                              "isRoot" : false,
                              "scope" : "boolean_literal_expr",
                              "tags" : [
                                "initializer=**NULL**",
                                "value=true"
                              ]
                            }
                          ],
                          "identifier" : "501075E5-D00B-4FCB-A398-C14688671D07",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [

                          ]
                        }
                      ],
                      "identifier" : "19077008-064D-4DB8-A8D6-299A405C605D",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "C54272BC-9880-4396-9E4D-E9EE64987A3E",
                  "isRoot" : false,
                  "name" : "AppDelegate.application(_:didFinishLaunchingWithOptions:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "C86CB40A-98C0-45BF-B19D-687E0DB9EF7C",
                      "isRoot" : false,
                      "name" : "AppDelegate.applicationWillResignActive(_:).self",
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
                            "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "2599AE82-09D4-4880-B495-36747FD83C05",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillResignActive(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "61105295-8356-4A89-8ACC-C61EC6443CDB",
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
                      "identifier" : "EF574A1E-B896-48CB-B995-51E5E765F676",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "7407F68E-846C-4AF5-BCA3-6401BF94838B",
                  "isRoot" : false,
                  "name" : "AppDelegate.applicationWillResignActive(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "E8632A35-3143-4EA9-8384-8644672F2A5A",
                      "isRoot" : false,
                      "name" : "AppDelegate.applicationDidEnterBackground(_:).self",
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
                            "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "3FC04F27-94C9-4F44-924A-57A328F9C794",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationDidEnterBackground(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "18E7ADE0-7798-4047-9EDC-DB5E66A4FDE0",
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
                      "identifier" : "5065F6B8-E4DB-4E68-B393-697FF64003D9",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "09DD34C3-D4A9-43C8-AAD8-F01B8A04E102",
                  "isRoot" : false,
                  "name" : "AppDelegate.applicationDidEnterBackground(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "B32EC7FE-2434-48E0-8612-2A68A21AC709",
                      "isRoot" : false,
                      "name" : "AppDelegate.applicationWillEnterForeground(_:).self",
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
                            "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "C92645AA-DEBC-43AD-83E6-E3F1D42B08D3",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillEnterForeground(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "BE58E384-F538-456A-B125-78673631D304",
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
                      "identifier" : "D6D83364-DF39-42E0-A423-202521016E06",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "02345A0C-7BC9-4D76-830F-43AF9CA39E36",
                  "isRoot" : false,
                  "name" : "AppDelegate.applicationWillEnterForeground(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "9C1F8C66-4B91-46D0-BEE1-795CE98E26B7",
                      "isRoot" : false,
                      "name" : "AppDelegate.applicationDidBecomeActive(_:).self",
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
                            "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "A9C55CE0-0B09-4FE7-9ED2-39AC7C9A8553",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationDidBecomeActive(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "D8B12221-651F-45E6-A6C8-EBB6F5696389",
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
                      "identifier" : "41C116E2-3A7B-41D5-9507-CAE4A7BC46CC",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "1C561628-EA44-4411-AFE7-131619624826",
                  "isRoot" : false,
                  "name" : "AppDelegate.applicationDidBecomeActive(_:)",
                  "scope" : "func_decl",
                  "tags" : [
                    "@objc",
                    "access=internal",
                    "interface"
                  ]
                },
                {
                  "arcs" : [
                    "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "626F3D23-7F98-494A-AC60-8F67C3CA6D1F",
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
                            "3E3493F9-989D-4F7A-AE9D-BA9D8C34348E"
                          ],
                          "children" : [

                          ],
                          "identifier" : "4B2499A8-689A-4A11-ADAB-023B3B05B235",
                          "isRoot" : false,
                          "name" : "AppDelegate.applicationWillTerminate(_:).application",
                          "scope" : "parameter",
                          "tags" : [
                            "interface"
                          ]
                        }
                      ],
                      "identifier" : "AFAC5AAF-B1C5-44F1-A15E-9D98FA0914D1",
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
                      "identifier" : "828671C1-05B8-46B9-A0BB-7803E92BFF30",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [

                      ]
                    }
                  ],
                  "identifier" : "5A142274-4CBD-414A-9FFE-81E781ED9BF9",
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
                      "identifier" : "A9FF4B04-20EB-4AB3-AA96-664874B5819C",
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
                      "identifier" : "901FD20F-C85E-42E9-9D62-110A4B40850A",
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
                      "identifier" : "0BAEDB38-2F14-43F5-A7B6-BF5529555396",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "7214C9B4-1867-4221-8F2C-99412DDD3733",
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
                    "B49BBF2D-7B92-450F-B9A4-0855424D4FD4"
                  ],
                  "children" : [
                    {
                      "arcs" : [

                      ],
                      "children" : [

                      ],
                      "identifier" : "99B43BA4-CE19-42EF-90B2-3A5C37EFF63D",
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
                      "identifier" : "BC265FEB-C2E7-4B8A-99DE-B325F1C614CD",
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
                                "BE94500A-5704-4BE8-8878-4D9FDB8EBB45"
                              ],
                              "children" : [
                                {
                                  "arcs" : [
                                    "BE94500A-5704-4BE8-8878-4D9FDB8EBB45"
                                  ],
                                  "children" : [
                                    {
                                      "arcs" : [
                                        "BE94500A-5704-4BE8-8878-4D9FDB8EBB45"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "5F971AA9-9100-4FC3-90D7-65B52DD63CFB",
                                      "isRoot" : false,
                                      "scope" : "other_constructor_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    },
                                    {
                                      "arcs" : [
                                        "BE94500A-5704-4BE8-8878-4D9FDB8EBB45"
                                      ],
                                      "children" : [

                                      ],
                                      "identifier" : "37D29BDA-8C18-48C9-851F-438D23A2ACC8",
                                      "isRoot" : false,
                                      "scope" : "super_ref_expr",
                                      "tags" : [
                                        "implicit"
                                      ]
                                    }
                                  ],
                                  "identifier" : "2D2ABA18-38AC-43BA-A595-6716E862D96A",
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
                                  "identifier" : "D7866923-B9A5-4E83-9A74-BC92020B5389",
                                  "isRoot" : false,
                                  "scope" : "tuple_expr",
                                  "tags" : [
                                    "implicit"
                                  ]
                                }
                              ],
                              "identifier" : "D22895D8-2016-46B4-8526-432EC37E272C",
                              "isRoot" : false,
                              "scope" : "call_expr",
                              "tags" : [
                                "arg_labels=",
                                "implicit",
                                "nothrow"
                              ]
                            }
                          ],
                          "identifier" : "E5B82AAF-5AC6-4F00-BA08-1DE6CB2399C7",
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
                          "identifier" : "68B90532-B40B-43CA-BC68-ACF0062C061C",
                          "isRoot" : false,
                          "scope" : "return_stmt",
                          "tags" : [
                            "implicit"
                          ]
                        }
                      ],
                      "identifier" : "AF9EB08E-88C7-4A90-9AE4-F7FE9E9F41E0",
                      "isRoot" : false,
                      "scope" : "brace_stmt",
                      "tags" : [
                        "implicit"
                      ]
                    }
                  ],
                  "identifier" : "629DB98B-B499-4A64-A8CB-EB4CF815B6EA",
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
              "identifier" : "D7506923-B01E-4B54-8D4F-280DD26BA7BA",
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
          "identifier" : "97B4BAB2-067C-426B-AC9C-C636321CC8C0",
          "isRoot" : false,
          "name" : "AppDelegateSourceFile",
          "scope" : "source_file",
          "tags" : [

          ]
        }
      ],
      "identifier" : "1B758824-A883-4DDC-AC77-5AA4C25A2C81",
      "isRoot" : false,
      "name" : "iOSSDK",
      "scope" : "module",
      "tags" : [

      ]
    }
  ],
  "identifier" : "102ED6BB-DC9C-4B78-8A8D-86CD05A93241",
  "isRoot" : true,
  "scope" : "root",
  "tags" : [

  ]
}
"""

}
