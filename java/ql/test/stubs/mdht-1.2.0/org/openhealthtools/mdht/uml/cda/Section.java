// Generated automatically from org.openhealthtools.mdht.uml.cda.Section for testing purposes

package org.openhealthtools.mdht.uml.cda;

import java.util.Map;
import org.eclipse.emf.common.util.DiagnosticChain;
import org.eclipse.emf.common.util.EList;
import org.openhealthtools.mdht.uml.cda.Author;
import org.openhealthtools.mdht.uml.cda.ClinicalDocument;
import org.openhealthtools.mdht.uml.cda.ClinicalStatement;
import org.openhealthtools.mdht.uml.cda.Component5;
import org.openhealthtools.mdht.uml.cda.Encounter;
import org.openhealthtools.mdht.uml.cda.Entry;
import org.openhealthtools.mdht.uml.cda.Informant12;
import org.openhealthtools.mdht.uml.cda.InfrastructureRootTypeId;
import org.openhealthtools.mdht.uml.cda.Observation;
import org.openhealthtools.mdht.uml.cda.ObservationMedia;
import org.openhealthtools.mdht.uml.cda.Organizer;
import org.openhealthtools.mdht.uml.cda.Procedure;
import org.openhealthtools.mdht.uml.cda.RegionOfInterest;
import org.openhealthtools.mdht.uml.cda.StrucDocText;
import org.openhealthtools.mdht.uml.cda.Subject;
import org.openhealthtools.mdht.uml.cda.SubstanceAdministration;
import org.openhealthtools.mdht.uml.cda.Supply;
import org.openhealthtools.mdht.uml.hl7.datatypes.CE;
import org.openhealthtools.mdht.uml.hl7.datatypes.CS;
import org.openhealthtools.mdht.uml.hl7.datatypes.II;
import org.openhealthtools.mdht.uml.hl7.datatypes.ST;
import org.openhealthtools.mdht.uml.hl7.vocab.ActClass;
import org.openhealthtools.mdht.uml.hl7.vocab.ActMood;
import org.openhealthtools.mdht.uml.hl7.vocab.NullFlavor;
import org.openhealthtools.mdht.uml.hl7.vocab.x_ActRelationshipEntry;

public interface Section extends org.openhealthtools.mdht.uml.hl7.rim.Act
{
    ActClass getClassCode();
    ActMood getMoodCode();
    CE getCode();
    CE getConfidentialityCode();
    CS getLanguageCode();
    ClinicalDocument getClinicalDocument();
    EList<Author> getAuthors();
    EList<CS> getRealmCodes();
    EList<ClinicalStatement> getEntryTargets(Object p0);
    EList<ClinicalStatement> getEntryTargets(x_ActRelationshipEntry p0, Object p1);
    EList<Component5> getComponents();
    EList<Encounter> getEncounters();
    EList<II> getTemplateIds();
    EList<Informant12> getInformants();
    EList<Observation> getObservations();
    EList<ObservationMedia> getObservationMedia();
    EList<Organizer> getOrganizers();
    EList<Procedure> getProcedures();
    EList<RegionOfInterest> getRegionsOfInterest();
    EList<Section> getAllSections();
    EList<Section> getSections();
    EList<SubstanceAdministration> getSubstanceAdministrations();
    EList<Supply> getSupplies();
    EList<org.openhealthtools.mdht.uml.cda.Act> getActs();
    II getId();
    InfrastructureRootTypeId getTypeId();
    NullFlavor getNullFlavor();
    ST getTitle();
    String getSectionId();
    StrucDocText createStrucDocText(String p0);
    StrucDocText getText();
    Subject getSubject();
    boolean hasActTemplate(String p0);
    boolean hasCode(String p0, String p1, String p2);
    boolean hasEncounterTemplate(String p0);
    boolean hasObservationMediaTemplate(String p0);
    boolean hasObservationTemplate(String p0);
    boolean hasOrganizerTemplate(String p0);
    boolean hasProcedureTemplate(String p0);
    boolean hasRegionOfInterestTemplate(String p0);
    boolean hasSectionTemplate(String p0);
    boolean hasSubstanceAdministrationTemplate(String p0);
    boolean hasSupplyTemplate(String p0);
    boolean hasTemplateId(String p0);
    boolean isSetClassCode();
    boolean isSetMoodCode();
    boolean isSetNullFlavor();
    boolean isSetSectionId();
    boolean validateClassCode(DiagnosticChain p0, Map<Object, Object> p1);
    boolean validateMoodCode(DiagnosticChain p0, Map<Object, Object> p1);
    org.eclipse.emf.common.util.EList<Entry> getEntries();
    void addAct(org.openhealthtools.mdht.uml.cda.Act p0);
    void addEncounter(Encounter p0);
    void addObservation(Observation p0);
    void addObservationMedia(ObservationMedia p0);
    void addOrganizer(Organizer p0);
    void addProcedure(Procedure p0);
    void addRegionOfInterest(RegionOfInterest p0);
    void addSection(Section p0);
    void addSubstanceAdministration(SubstanceAdministration p0);
    void addSupply(Supply p0);
    void setClassCode(ActClass p0);
    void setCode(CE p0);
    void setConfidentialityCode(CE p0);
    void setId(II p0);
    void setLanguageCode(CS p0);
    void setMoodCode(ActMood p0);
    void setNullFlavor(NullFlavor p0);
    void setSectionId(String p0);
    void setSubject(Subject p0);
    void setText(StrucDocText p0);
    void setTitle(ST p0);
    void setTypeId(InfrastructureRootTypeId p0);
    void unsetClassCode();
    void unsetMoodCode();
    void unsetNullFlavor();
    void unsetSectionId();
}
