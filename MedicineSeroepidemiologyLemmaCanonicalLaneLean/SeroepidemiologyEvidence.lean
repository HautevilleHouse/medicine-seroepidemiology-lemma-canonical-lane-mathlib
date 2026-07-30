import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure SeroepidemiologyEvidencePackage where
  seroprevalenceData : Prop
  incidenceEstimate : Prop
  transmissionDynamics : Prop
  immunityDuration : Prop
  vaccineEffectiveness : Prop
  publicHealthIntervention : Prop

structure SeroepidemiologyEvidenceEvidence (S : SeroepidemiologyEvidencePackage) where
  seroprevalenceDataClosed : S.seroprevalenceData
  incidenceEstimateClosed : S.incidenceEstimate
  transmissionDynamicsClosed : S.transmissionDynamics
  immunityDurationClosed : S.immunityDuration
  vaccineEffectivenessClosed : S.vaccineEffectiveness
  publicHealthInterventionClosed : S.publicHealthIntervention

def SeroepidemiologyEvidenceClosed (S : SeroepidemiologyEvidencePackage) : Prop :=
  S.seroprevalenceData ∧ S.incidenceEstimate ∧ S.transmissionDynamics ∧ S.immunityDuration ∧ S.vaccineEffectiveness ∧ S.publicHealthIntervention

theorem seroepidemiology_evidence_closed_from_evidence (S : SeroepidemiologyEvidencePackage) (E : SeroepidemiologyEvidenceEvidence S) :
    SeroepidemiologyEvidenceClosed S := by
  exact And.intro E.seroprevalenceDataClosed
    (And.intro E.incidenceEstimateClosed
      (And.intro E.transmissionDynamicsClosed
        (And.intro E.immunityDurationClosed
          (And.intro E.vaccineEffectivenessClosed E.publicHealthInterventionClosed))))

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse