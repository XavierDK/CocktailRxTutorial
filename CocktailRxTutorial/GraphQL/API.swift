//  This file was automatically generated and should not be edited.

import Apollo

/// Values for the MeasurementUnit enum
public enum MeasurementUnit: String {
  case grams = "grams"
  case centiliter = "centiliter"
  case spoon = "spoon"
}

extension MeasurementUnit: JSONDecodable, JSONEncodable {}

public final class GetAllCocktailsQuery: GraphQLQuery {
  public static let operationDefinition =
    "query GetAllCocktails {" +
    "  viewer {" +
    "    __typename" +
    "    allCocktails {" +
    "      __typename" +
    "      edges {" +
    "        __typename" +
    "        cursor" +
    "        node {" +
    "          __typename" +
    "          id" +
    "          name" +
    "          ingredients {" +
    "            __typename" +
    "            edges {" +
    "              __typename" +
    "              node {" +
    "                __typename" +
    "                id" +
    "                name" +
    "                unit" +
    "              }" +
    "            }" +
    "          }" +
    "        }" +
    "      }" +
    "    }" +
    "  }" +
    "}"
  public init() {
  }

  public struct Data: GraphQLMappable {
    public let viewer: Viewer?

    public init(reader: GraphQLResultReader) throws {
      viewer = try reader.optionalValue(for: Field(responseName: "viewer"))
    }

    public struct Viewer: GraphQLMappable {
      public let __typename: String
      public let allCocktails: AllCocktail?

      public init(reader: GraphQLResultReader) throws {
        __typename = try reader.value(for: Field(responseName: "__typename"))
        allCocktails = try reader.optionalValue(for: Field(responseName: "allCocktails"))
      }

      public struct AllCocktail: GraphQLMappable {
        public let __typename: String
        public let edges: [Edge?]?

        public init(reader: GraphQLResultReader) throws {
          __typename = try reader.value(for: Field(responseName: "__typename"))
          edges = try reader.optionalList(for: Field(responseName: "edges"))
        }

        public struct Edge: GraphQLMappable {
          public let __typename: String
          public let cursor: String
          public let node: Node

          public init(reader: GraphQLResultReader) throws {
            __typename = try reader.value(for: Field(responseName: "__typename"))
            cursor = try reader.value(for: Field(responseName: "cursor"))
            node = try reader.value(for: Field(responseName: "node"))
          }

          public struct Node: GraphQLMappable {
            public let __typename: String
            public let id: GraphQLID
            public let name: String
            public let ingredients: Ingredient?

            public init(reader: GraphQLResultReader) throws {
              __typename = try reader.value(for: Field(responseName: "__typename"))
              id = try reader.value(for: Field(responseName: "id"))
              name = try reader.value(for: Field(responseName: "name"))
              ingredients = try reader.optionalValue(for: Field(responseName: "ingredients"))
            }

            public struct Ingredient: GraphQLMappable {
              public let __typename: String
              public let edges: [Edge?]?

              public init(reader: GraphQLResultReader) throws {
                __typename = try reader.value(for: Field(responseName: "__typename"))
                edges = try reader.optionalList(for: Field(responseName: "edges"))
              }

              public struct Edge: GraphQLMappable {
                public let __typename: String
                public let node: Node

                public init(reader: GraphQLResultReader) throws {
                  __typename = try reader.value(for: Field(responseName: "__typename"))
                  node = try reader.value(for: Field(responseName: "node"))
                }

                public struct Node: GraphQLMappable {
                  public let __typename: String
                  public let id: GraphQLID
                  public let name: String
                  public let unit: MeasurementUnit

                  public init(reader: GraphQLResultReader) throws {
                    __typename = try reader.value(for: Field(responseName: "__typename"))
                    id = try reader.value(for: Field(responseName: "id"))
                    name = try reader.value(for: Field(responseName: "name"))
                    unit = try reader.value(for: Field(responseName: "unit"))
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}