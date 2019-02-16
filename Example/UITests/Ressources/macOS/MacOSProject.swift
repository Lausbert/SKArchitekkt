//  Copyright © 2019 Stephan Lerner. All rights reserved.

import Foundation

struct MacOSProject: Ressource {

    static let jsonString: String = """
{
  "children" : [
    {
      "children" : [
        {
          "arcs" : [
            {
              "identifier" : "NSObject",
              "isRoot" : false,
              "scope" : "unknown"
            },
            {
              "identifier" : "NSApplicationDelegate",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "children" : [
            {
              "arcs" : [
                {
                  "identifier" : "NSWindow",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.window",
              "isRoot" : false,
              "scope" : "variable"
            },
            {
              "arcs" : [
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationDidFinishLaunching(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "arcs" : [
                {
                  "identifier" : "Notification",
                  "isRoot" : false,
                  "scope" : "unknown"
                }
              ],
              "identifier" : "AppDelegate.applicationWillTerminate(_:)",
              "isRoot" : false,
              "scope" : "function"
            },
            {
              "identifier" : "AppDelegate.Type",
              "isRoot" : false,
              "scope" : "unknown"
            }
          ],
          "identifier" : "AppDelegate",
          "isRoot" : false,
          "scope" : "class"
        }
      ],
      "identifier" : "AppDelegateSourceFile",
      "isRoot" : false,
      "scope" : "sourceFile"
    },
    {
      "identifier" : "NSApplicationDelegate",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "NSObject",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "NSWindow",
      "isRoot" : false,
      "scope" : "unknown"
    },
    {
      "identifier" : "Notification",
      "isRoot" : false,
      "scope" : "unknown"
    }
  ],
  "isRoot" : true,
  "scope" : "root"
}
"""
    
}
