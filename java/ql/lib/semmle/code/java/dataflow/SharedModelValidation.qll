/**
 * INTERNAL: Do not use.
 *
 * Provides classes for validating kinds in models as data rows.
 * Such that we can share this logic across our CodeQL analysis of different languages.
 */

/** A valid models-as-data sink kind. */
class ValidSinkKind extends string {
  bindingset[this]
  ValidSinkKind() {
    this =
      [
        // shared
        "code-injection", "command-injection", "file-content-store", "html-injection",
        "js-injection", "ldap-injection", "log-injection", "path-injection", "request-forgery",
        "sql-injection", "url-redirection",
        // Java-only currently, but may be shared in the future
        "bean-validation", "fragment-injection", "groovy-injection", "hostname-verification",
        "information-leak", "intent-redirection", "jexl-injection", "jndi-injection",
        "mvel-injection", "ognl-injection", "pending-intents", "response-splitting",
        "template-injection", "xpath-injection", "xslt-injection",
        // JavaScript-only currently, but may be shared in the future
        "mongodb.sink", "nosql-injection", "unsafe-deserialization",
        // Swift-only currently, but may be shared in the future
        "database-store", "format-string", "hash-iteration-count", "predicate-injection",
        "preferences-store", "tls-protocol-version", "transmission", "webview-fetch", "xxe"
      ]
    or
    this.matches([
        // shared
        "encryption-%", "qltest%", "test-%",
        // Java-only currently, but may be shared in the future
        "regex-use%",
        // JavaScript-only currently, but may be shared in the future
        "credentials-%",
        // Swift-only currently, but may be shared in the future
        "%string-%length", "weak-hash-input-%"
      ])
  }
}

class OutdatedSinkKind extends string {
  OutdatedSinkKind() {
    this =
      [
        "sql", "url-redirect", "xpath", "ssti", "logging", "groovy", "jexl", "mvel", "xslt", "ldap",
        "pending-intent-sent", "intent-start", "set-hostname-verifier", "header-splitting", "xss",
        "write-file", "create-file", "read-file", "open-url", "jdbc-url", "command-line-injection",
        "code", "html", "remote"
      ]
  }

  private string replacementKind() {
    this = ["sql", "xpath", "groovy", "jexl", "mvel", "xslt", "ldap", "code", "html"] and
    result = this + "-injection"
    or
    this = "url-redirect" and result = "url-redirection"
    or
    this = "ssti" and result = "template-injection"
    or
    this = "logging" and result = "log-injection"
    or
    this = "pending-intent-sent" and result = "pending-intents"
    or
    this = "intent-start" and result = "intent-redirection"
    or
    this = "set-hostname-verifier" and result = "hostname-verification"
    or
    this = "header-splitting" and result = "response-splitting"
    or
    this = "xss" and result = "html-injection\" or \"js-injection"
    or
    this = ["write-file", "remote"] and result = "file-content-store"
    or
    this = ["create-file", "read-file"] and result = "path-injection"
    or
    this = ["open-url", "jdbc-url"] and result = "request-forgery"
    or
    this = "command-line-injection" and result = "command-injection"
  }

  string outdatedMessage() {
    result =
      "The kind \"" + this + "\" is outdated. Use \"" + this.replacementKind() + "\" instead."
  }
}

/** A valid models-as-data source kind. */
class ValidSourceKind extends string {
  bindingset[this]
  ValidSourceKind() {
    this =
      [
        // shared
        "local", "remote",
        // Java
        "android-external-storage-dir", "contentprovider",
        // C#
        "file", "file-write",
        // JavaScript
        "database-access-result", "remote-flow"
      ]
    or
    this.matches([
        // shared
        "qltest%", "test-%",
        // Swift
        "%string-%length"
      ])
  }
}

/** A valid models-as-data summary kind. */
class ValidSummaryKind extends string {
  ValidSummaryKind() {
    this =
      [
        // shared
        "taint", "value",
        // JavaScript
        "type"
      ]
  }
}

/** A valid models-as-data neutral kind. */
class ValidNeutralKind extends string {
  ValidNeutralKind() {
    this =
      [
        // Java/C# currently
        "sink", "source", "summary"
      ]
  }
}
