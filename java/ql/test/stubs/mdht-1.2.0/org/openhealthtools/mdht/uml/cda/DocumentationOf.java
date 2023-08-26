// Generated automatically from org.openhealthtools.mdht.uml.cda.DocumentationOf for testing purposes

package org.openhealthtools.mdht.uml.cda;

import java.util.Map;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.EList;
import org.openhealthtools.mdht.uml.cda.InfrastructureRootTypeId;
import org.openhealthtools.mdht.uml.cda.ServiceEvent;
import org.openhealthtools.mdht.uml.hl7.datatypes.CS;
import org.openhealthtools.mdht.uml.hl7.datatypes.II;
import org.openhealthtools.mdht.uml.hl7.rim.ActRelationship;
import org.openhealthtools.mdht.uml.hl7.vocab.ActRelationshipType;
import org.openhealthtools.mdht.uml.hl7.vocab.NullFlavor;

public interface DocumentationOf extends ActRelationship
{
    ActRelationshipType getTypeCode();
    EList<CS> getRealmCodes();
    EList<II> getTemplateIds();
    InfrastructureRootTypeId getTypeId();
    NullFlavor getNullFlavor();
    ServiceEvent getServiceEvent();
    boolean isSetNullFlavor();
    boolean isSetTypeCode();
    boolean validateTypeCode(DiagnosticChain p0, Map<Object, Object> p1);
    void setNullFlavor(NullFlavor p0);
    void setServiceEvent(ServiceEvent p0);
    void setTypeCode(ActRelationshipType p0);
    void setTypeId(InfrastructureRootTypeId p0);
    void unsetNullFlavor();
    void unsetTypeCode();
}
