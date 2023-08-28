/**
 * @name Use of JWT Methods that only decode user provided Token
 * @description Using JWT methods without verification can cause to authorization or authentication bypass
 * @kind path-problem
 * @problem.severity error
 * @id go/hardcoded-key
 * @tags security
 *       experimental
 *       external/cwe/cwe-321
 */

import go
import semmle.go.security.JWT

module WithValidationConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) { source instanceof UntrustedFlowSource }

  predicate isSink(DataFlow::Node sink) {
    sink = any(GolangJwtValidField parse) or
    sink = any(GoJoseClaims parse).getACall().getReceiver()
  }

  predicate isAdditionalFlowStep(DataFlow::Node nodeFrom, DataFlow::Node nodeTo) {
    golangJwtIsAdditionalFlowStep(nodeFrom, nodeTo)
    or
    goJoseIsAdditionalFlowStep(nodeFrom, nodeTo)
  }
}

module NoValidationConfig implements DataFlow::ConfigSig {
  predicate isSource(DataFlow::Node source) {
    source instanceof UntrustedFlowSource and
    not WithValidation::flow(source, _)
  }

  predicate isSink(DataFlow::Node sink) {
    sink = any(GolangJwtParseUnverified parseunverified).getACall().getArgument(0)
    or
    sink = any(GoJoseUnsafeClaims parse).getACall().getReceiver()
  }

  predicate isAdditionalFlowStep(DataFlow::Node nodeFrom, DataFlow::Node nodeTo) {
    golangJwtIsAdditionalFlowStep(nodeFrom, nodeTo)
    or
    goJoseIsAdditionalFlowStep(nodeFrom, nodeTo)
  }
}

module WithValidation = TaintTracking::Global<WithValidationConfig>;

module NoValidation = TaintTracking::Global<NoValidationConfig>;

import NoValidation::PathGraph

from NoValidation::PathNode source, NoValidation::PathNode sink
where NoValidation::flowPath(source, sink)
select sink.getNode(), source, sink, "This  $@.", source.getNode(), "decode"
