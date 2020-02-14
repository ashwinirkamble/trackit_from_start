var unitPopup;
var strWindowFeatures = "menubar=no,location=no,resizable=yes,scrollbars=yes,status=no,width=1020,height=700";
function showUnitPopup(shipFk, projectPk) {
  unitPopup = window.open('/unit.do?id=' + shipFk + '&projectPk=' + projectPk, "Unit View", strWindowFeatures);
  return false;
}