import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure PharmacokineticPackage where
  doseRegimen : Prop
  absorptionRate : Prop
  distributionVolume : Prop
  eliminationRate : Prop
  plasmaConcentration : Prop
  therapeuticWindow : Prop

structure PharmacokineticEvidence (P : PharmacokineticPackage) where
  doseRegimenClosed : P.doseRegimen
  absorptionRateClosed : P.absorptionRate
  distributionVolumeClosed : P.distributionVolume
  eliminationRateClosed : P.eliminationRate
  plasmaConcentrationClosed : P.plasmaConcentration
  therapeuticWindowClosed : P.therapeuticWindow

def PharmacokineticClosed (P : PharmacokineticPackage) : Prop :=
  P.doseRegimen ∧ P.absorptionRate ∧ P.distributionVolume ∧ P.eliminationRate ∧ P.plasmaConcentration ∧ P.therapeuticWindow

theorem pharmacokinetic_closed_from_evidence (P : PharmacokineticPackage) (E : PharmacokineticEvidence P) :
    PharmacokineticClosed P := by
  exact And.intro E.doseRegimenClosed
    (And.intro E.absorptionRateClosed
      (And.intro E.distributionVolumeClosed
        (And.intro E.eliminationRateClosed
          (And.intro E.plasmaConcentrationClosed E.therapeuticWindowClosed))))

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse