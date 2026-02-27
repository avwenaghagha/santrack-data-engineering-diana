PRINT ' INSPECTION RESULTS ';
SELECT
    id,
    officer_id,
    FORMAT(lat, 'F4') AS latitude,
    FORMAT(lon, 'F4') AS longitude,
    risk_score,
    status,
    checklist
FROM inspections
ORDER BY risk_score DESC;
GO

PRINT '=== RISK SUMMARY ===';
SELECT
    status,
    COUNT(*) AS total_inspections,
    ROUND(AVG(risk_score), 2) AS avg_risk,
    MAX(risk_score) AS highest_risk,
    MIN(risk_score) AS lowest_risk
FROM inspections
GROUP BY status
ORDER BY AVG(risk_score) DESC;
GO

PRINT '=== FUNCTION TEST ===';
SELECT
    'High Risk Test' AS test_case,
    dbo.CalculateRiskScore('{"handwashing": false, "pests": true, "waste_disposal": false, "stagnant_water": true}') AS score;
GO