Feature: Counter R5 Loading - Platform Filtering
  AS A Usage Consolidation Administrator
  I WANT the ability to filter my configured platforms on the Load COUNTER Files page
  SO THAT I can increase efficiency while loading reports by filtering to specific subsets
  of platforms including Managed by EBSCO, Not Managed by EBSCO and Ready to Load (this limiter must work in conjunction with other types)

  Scenario Outline: Filtering platforms
    Given the following platforms:
      | platformName | managedByEbsco | readyToLoad |
      | P1           | true           | true        |
      | P2           | true           | false       |
      | P3           | false          | true        |
      | P4           | false          | false       |
    Given the managed by filter is <managedByfilter>
    Given then ready to load filters is <readyToLoadFilter>
    When I search for platforms
    Then I should see <results>
    Examples:
      | managedByFilter | readyToLoadFilter | results          |
      | EBSCO           | false             | [P1, P2]         |
      | EBSCO           | true              | [p1]             |
      | NOT_EBSCO       | false             | [P3, P4]         |
      | NOT_EBSCO       | true              | [P3]             |
      | ALL             | false             | [P1, P2, P3, P4] |
      | ALL             | true              | [P1, P3]         |



