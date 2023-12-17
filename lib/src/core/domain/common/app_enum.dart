enum SortProductBy {
  NameAtoZ("NameAtoZ"),
  NameZtoA("NameZtoA"),
  DateOldToNew("DateOldToNew"),
  DateNewToOld("DateNewToOld"),
  EventVenueAtoZ("EventVenueAtoZ"),
  EventVenueZtoA("EventVenueZtoA"),
  Default("Default");

  final String value;
  const SortProductBy(this.value);
}
