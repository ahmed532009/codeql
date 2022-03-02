/**
 * @name Missing X-Frame-Options HTTP header
 * @description If the 'X-Frame-Options' setting is not provided or specify sameorigin, a malicious user may be able to
 *              overlay their own UI on top of the site by using an iframe.
 * @kind problem
 * @problem.severity error
 * @security-severity 7.5
 * @precision high
 * @id java/clickjacking
 * @tags security
 *       external/cwe/cwe-451
 */

import java
import semmle.code.java.frameworks.Servlets

private predicate hasCodeXFrameOptions(MethodAccess header) {
  (
    header.getMethod() instanceof ResponseSetHeaderMethod or
    header.getMethod() instanceof ResponseAddHeaderMethod
  ) and
  header.getArgument(0).(CompileTimeConstantExpr).getStringValue().toLowerCase() = "x-frame-options" 
}

private predicate hasCodeXFramecheck(MethodAccess header) {
  (
    header.getMethod() instanceof ResponseSetHeaderMethod or
    header.getMethod() instanceof ResponseAddHeaderMethod
  ) and
  header.getArgument(0).(CompileTimeConstantExpr).getStringValue().toLowerCase() = "x-frame-options" and
  header.getArgument(1).(CompileTimeConstantExpr).getStringValue().toLowerCase() = "sameorigin"
}

from MethodAccess call
where
  not hasCodeXFrameOptions(call) and
  hasCodeXFramecheck(call)
select call, "Configuration missing the X-Frame-Options setting."
