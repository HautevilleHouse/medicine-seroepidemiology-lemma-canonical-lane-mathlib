import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MedicineSeroepidemiologyLemmaCanonicalLaneLean

structure PharmacokineticsModel where
  dose : ℝ
  absorptionRate : ℝ
  eliminationRate : ℝ
  volumeDistribution : ℝ
  concentration : ℝ
  time : ℝ
  concentrationClosed : ℝ

structure PharmacokineticsModelEvidence (P : PharmacokineticsModel) where
  dosePositive : P.dose > 0
  absorptionRatePositive : P.absorptionRate > 0
  eliminationRatePositive : P.eliminationRate > 0
  volumeDistributionPositive : P.volumeDistribution > 0
  concentrationFormula : P.concentration = (P.dose / P.volumeDistribution) * (P.absorptionRate / (P.absorptionRate - P.eliminationRate)) * (Real.exp (-P.eliminationRate * P.time) - Real.exp (-P.absorptionRate * P.time))

def PharmacokineticsModelClosed (P : PharmacokineticsModel) : Prop :=
  P.concentration = (P.dose / P.volumeDistribution) * (P.absorptionRate / (P.absorptionRate - P.eliminationRate)) * (Real.exp (-P.eliminationRate * P.time) - Real.exp (-P.absorptionRate * P.time))

theorem pharmacokinetics_model_closed_from_evidence (P : PharmacokineticsModel) (E : PharmacokineticsModelEvidence P) : PharmacokineticsModelClosed P := by
  exact E.concentrationFormula

end MedicineSeroepidemiologyLemmaCanonicalLaneLean
end HautevilleHouse
