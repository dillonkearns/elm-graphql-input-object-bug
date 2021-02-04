module.exports = `
schema {
  query: RootQueryType
  mutation: RootMutationType
}

type PageInfo {
  "When paginating backwards, are there more items?"
  hasPreviousPage: Boolean!

  "When paginating forwards, are there more items?"
  hasNextPage: Boolean!

  "When paginating backwards, the cursor to continue."
  startCursor: String

  "When paginating forwards, the cursor to continue."
  endCursor: String
}

enum SortDirection {
  ASC
  ASC_NULLS_LAST
  ASC_NULLS_FIRST
  DESC
  DESC_NULLS_LAST
  DESC_NULLS_FIRST
}

type Inspection {
  "The ID of an object"
  id: ID!

  name: String

  status: InspectionStatus

  scheduledDate: String

  requestedTime: String

  suggestedTime: String

  notes: String

  insertedAt: String

  updatedAt: String

  availableDays: [InspectionAvailabilityDate]

  projectStep: ProjectStep

  assignedUser: User

  items: [InspectionItem]

  punchListItems: [PunchListItem]
}

type ShapePolygon {
  kind: String
  geometry: [ShapePoint]
}

union TaskResourceUnion = Project | Version | Inspection

union ShapeUnion = ShapeLine | ShapeArrow | ShapeCircle | ShapeRectangle | ShapeFreehand | ShapePolygon

type PunchListItem {
  "The ID of an object"
  id: ID!

  note: String

  shapes: [ShapeUnion]

  status: PunchListItemStatus

  insertedAt: String

  updatedAt: String

  submission: Submission

  imageCloudFile: CloudFile
}

type InspectionItem {
  "The ID of an object"
  id: ID!

  title: String

  isChecked: Boolean

  insertedAt: String

  updatedAt: String

  inspection: Inspection
}

type Parcel {
  "The ID of an object"
  id: ID!

  parcelId: String

  address: String

  lonlat: String

  owner: String

  acreage: String

  landUse: String
}

type LineGeometry {
  p1: ShapePoint
  p2: ShapePoint
}

type Meeting {
  "The ID of an object"
  id: ID!

  name: String

  datetime: String

  insertedAt: String

  updatedAt: String
}

type ProjectStepTemplate {
  "The ID of an object"
  id: ID!

  name: String

  description: String

  kind: String

  order: Int

  insertedAt: String

  updatedAt: String

  jurisdiction: Jurisdiction

  projectType: ProjectType
}

type Issue {
  "The ID of an object"
  id: ID!

  title: String

  isResolved: Boolean

  insertedAt: String

  updatedAt: String

  submission: Submission

  user: User

  comments: [Comment]
}

type MeetingSchedule {
  "The ID of an object"
  id: ID!

  name: String

  deadlineDays: Int

  startDatetime: String

  frequency: String

  interval: Int

  positions: [Int]

  daysOfTheWeek: [Int]

  daysOfTheMonth: [Int]

  daysOfTheYear: [Int]

  weeksOfTheYear: [Int]

  monthsOfTheYear: [Int]

  insertedAt: String

  updatedAt: String
}

type ShapeRectangle {
  kind: String
  geometry: RectangleGeometry
}

type FormField {
  uuid: String
  kind: String
  value: String
}

input ProjectStepInput {
  projectStepTemplateId: ID!
}

input FormFieldInput {
  uuid: String!
  kind: String!
  value: String
}

type Comment {
  "The ID of an object"
  id: ID!

  body: String

  insertedAt: String

  updatedAt: String

  user: User
}

type ShapePoint {
  x: Float
  y: Float
}

input InspectionFilters {
  jurisdictionId: ID
  userId: ID
  startDate: String
  endDate: String
}

type ProjectStep {
  "The ID of an object"
  id: ID!

  name: String

  description: String

  kind: String

  status: ProjectStepStatus

  order: Int

  insertedAt: String

  updatedAt: String

  stepable: StepableUnion

  project: Project

  projectStepTemplate: ProjectStepTemplate
}

type Version {
  "The ID of an object"
  id: ID!

  isReady: Boolean

  tileSigningParams: Json

  processingStats: Json

  insertedAt: String

  updatedAt: String

  document: Document

  cloudFile: CloudFile

  user: User

  pages: [Page]

  stampedDocuments: [StampedDocument]
}

type InspectionTemplateItem {
  "The ID of an object"
  id: ID!

  title: String

  insertedAt: String

  updatedAt: String

  inspectionTemplate: InspectionTemplate
}

interface Node {
  "The id of the object."
  id: ID!
}

type InspectionAvailabilityDate {
  day: String
  isAvailable: Boolean
  isScheduled: Boolean
}

type AnnotationEdge {
  node: Annotation
  cursor: String
}

type ProjectEdge {
  node: Project
  cursor: String
}

type Document {
  "The ID of an object"
  id: ID!

  name: String

  isReady: Boolean

  commentCount: Int

  insertedAt: String

  updatedAt: String

  submission: Submission

  versions: [Version]

  reviewRequests: [ReviewRequest]

  documentable: DocumentableUnion
}

input ShapeInput {
  kind: String
  geometry: [[Float]]
}

type StampedDocument {
  "The ID of an object"
  id: ID!

  isReady: Boolean

  downloadUrl: String

  insertedAt: String

  updatedAt: String

  version: Version

  stamp: Stamp
}

input ProjectSort {
  direction: SortDirection
  field: ProjectSortOption
}

input DocumentInput {
  name: String!
  versions: [VersionInput]
}

enum InspectionStatus {
  PASSED
  FAILED
}

union StepableUnion = Submission | Meeting | Inspection

enum ProjectSortOption {
  NUMBER
  USER
  PROJECT_TYPE
  ADDRESS
  NAME
  COMMENTS
  INSERTED_AT
}

scalar Json

type ProjectConnection {
  pageInfo: PageInfo!
  edges: [ProjectEdge]
}

type AnnotationConnection {
  pageInfo: PageInfo!
  edges: [AnnotationEdge]
}

type RootMutationType {
  createCloudFile(filename: String, contentType: String, externalUrl: String, width: Int, height: Int): CloudFile
  createDocument(name: String!, documentableSubmissionId: ID): Document
  updateInspectionItem(id: ID!, isChecked: Boolean): InspectionItem
  updateInspection(id: ID!, scheduledDate: String, requestedTime: String, notes: String, status: InspectionStatus): Inspection
  createProject(
    jurisdictionId: ID!, name: String!, description: String!, permissions: [PermissionInput]!, parcels: [ParcelInput]!, documents: [DocumentInput]!
  ): Project
  updateProject(
    id: ID!, name: String, description: String, permissions: [PermissionInput], parcels: [ParcelInput], projectSteps: [ProjectStepInput]
  ): Project
  updateProjectStep(id: ID!, status: ProjectStepStatus): ProjectStep
  createPunchListItem(inspectionId: ID!, imageCloudFileId: String!, shapes: [ShapeInput], note: String!): PunchListItem
  updatePunchListItem(id: ID!, note: String, status: PunchListItemStatus): PunchListItem
  deletePunchListItem(id: ID!): PunchListItem
  createReviewRequest(documentId: ID!, reviewRequestableUserId: ID, reviewRequestableGroupId: ID): ReviewRequest
  deleteReviewRequest(id: ID!): ReviewRequest
  updateSubmission(id: ID!, formData: [FormFieldInput]): Submission
  createUser(email: String!): User
  createVersion(documentId: ID!, cloudFileId: String!): Version
}

type Task {
  "The ID of an object"
  id: ID!

  key: String

  resource: TaskResourceUnion
}

type RootQueryType {
  annotations(after: String, first: Int, before: String, last: Int, documentId: ID!, filter: Json, sort: String): AnnotationConnection
  annotation(id: ID!): Annotation
  cloudFile(id: ID!): CloudFile
  comment(id: ID!): Comment
  document(id: ID!): Document
  firm(id: ID!): Firm
  form(id: ID!): Form
  group(id: ID!): Group
  inspectionItem(id: ID!): InspectionItem
  inspection(id: ID!): Inspection
  inspections(after: String, first: Int, before: String, last: Int, sort: [InspectionSort], filter: InspectionFilters): InspectionConnection
  inspectionTemplateItem(id: ID!): InspectionTemplateItem
  inspectionTemplate(id: ID!): InspectionTemplate
  issue(id: ID!): Issue
  jurisdictions(after: String, first: Int, before: String, last: Int): JurisdictionConnection
  jurisdiction(id: ID!): Jurisdiction
  page(id: ID!): Page
  permission(id: ID!): Permission
  project(id: ID!): Project
  projects(after: String, first: Int, before: String, last: Int, sort: [ProjectSort], filter: ProjectFilters!): ProjectConnection
  projectType(after: String, first: Int, before: String, last: Int, jurisdictionId: ID!, filter: Json, sort: String): AnnotationConnection
  punchListItem(id: ID!): PunchListItem
  reviewRequest(id: ID!): ReviewRequest
  stamp(id: ID!): Stamp
  stampedDocument(id: ID!): StampedDocument
  user(id: ID!): User
  tasks: [Task]
  version(id: ID!): Version
  node(
    "The id of an object."
    id: ID!
  ): Node
}

type ProjectType {
  "The ID of an object"
  id: ID!

  name: String

  description: String

  insertedAt: String

  updatedAt: String

  jurisdiction: Jurisdiction

  projectStepTemplates: [ProjectStepTemplate]
}

type Page {
  "The ID of an object"
  id: ID!

  width: Int

  integer: Int

  calibration: String

  thumbnailUrl: String

  unresolvedCount: Int

  insertedAt: String

  updatedAt: String

  version: Version

  annotations: [Annotation]
}

type InspectionTemplate {
  "The ID of an object"
  id: ID!

  name: String

  secondsPerSqFt: Float

  insertedAt: String

  updatedAt: String

  jurisdiction: Jurisdiction

  users: [User]

  items: [InspectionTemplateItem]
}

type JurisdictionEdge {
  node: Jurisdiction
  cursor: String
}

type ShapeCircle {
  kind: String
  geometry: CircleGeometry
}

scalar DateTime

type InspectionEdge {
  node: Inspection
  cursor: String
}

type Project {
  "The ID of an object"
  id: ID!

  internalId: String

  name: String

  number: String

  description: String

  commentCount: Int

  insertedAt: String

  updatedAt: String

  jurisdiction: Jurisdiction

  documents: [Document]

  permissions: [Permission]

  parcels: [Parcel]

  projectSteps: [ProjectStep]
}

"GEOJson Point"
scalar Point

enum InspectionSort {
  SCHEDULED_DATE
  TIME
}

input PermissionInput {
  permission: Int!
  role: String!
  user: UserInput!
}

enum ProjectStepStatus {
  IN_PROGRESS
  COMPLETED
  APPROVED
}

input ProjectFilters {
  jurisdictionId: String!
  number: String
  projectType: String
  name: String
  address: String
  comments: String
  insertedAt: String
}

enum PunchListItemStatus {
  FIXED
}

type Submission {
  "The ID of an object"
  id: ID!

  internalId: String

  commentCount: Int

  formData: [FormField]

  insertedAt: DateTime

  updatedAt: DateTime

  projectStep: ProjectStep

  form: Form

  documents: [Document]

  issues: [Issue]
}

type Permission {
  "The ID of an object"
  id: ID!

  permission: Int

  role: String

  insertedAt: String

  updatedAt: String

  user: User
}

type Jurisdiction {
  "The ID of an object"
  id: ID!

  name: String

  status: String

  population: Int

  density: Int

  timezone: String

  lonlat: Point

  insertedAt: String

  updatedAt: String

  displayName: String

  parent: Jurisdiction

  forms: [Form]

  projects: [Project]

  users: [User]
}

type InspectionConnection {
  pageInfo: PageInfo!
  edges: [InspectionEdge]
}

union DocumentableUnion = Project | Submission

union ReviewRequestableUnion = User | Group

type JurisdictionConnection {
  pageInfo: PageInfo!
  edges: [JurisdictionEdge]
}

type Annotation {
  "The ID of an object"
  id: ID!

  body: String

  shapes: [ShapeUnion]

  status: String

  isResolved: Boolean

  insertedAt: String

  updatedAt: String

  page: Page

  user: User

  comments: [Comment]
}

type Form {
  "The ID of an object"
  id: ID!

  name: String

  instructions: String

  insertedAt: String

  updatedAt: String

  jurisdiction: Jurisdiction
}

type Firm {
  "The ID of an object"
  id: ID!

  insertedAt: String

  updatedAt: String
}

type ArrowGeometry {
  p1: ShapePoint
  p2: ShapePoint
}

type RectangleGeometry {
  x: Float
  y: Float
  width: Float
  height: Float
}

type CircleGeometry {
  center: ShapePoint
  radius: Float
}

type ShapeArrow {
  kind: String
  geometry: ArrowGeometry
}

type ShapeLine {
  kind: String
  geometry: LineGeometry
}

type CloudFile {
  "The ID of an object"
  id: ID!

  contentType: String

  filename: String

  height: Int

  width: Int

  token: String

  externalUrl: String

  size: String

  insertedAt: String

  updatedAt: String

  downloadUrl: String

  uploadUrl: String

  isUploaded: String
}

input VersionInput {
  cloudFileId: String
}

type ReviewRequest {
  "The ID of an object"
  id: ID!

  status: String

  insertedAt: String

  updatedAt: String

  document: Document

  reviewRequestable: ReviewRequestableUnion
}

input UserInput {
  name: String!
  company: String!
  phone: String!
  email: String!
  address: String!
  lonlat: String!
}

input ParcelInput {
  parcelId: String!
  address: String!
  lonlat: String!
  owner: String
  acreage: String
  landUse: String
  data: Json
}

type ShapeFreehand {
  kind: String
  geometry: [ShapePoint]
}

type User {
  "The ID of an object"
  id: ID!

  name: String

  email: String

  phone: String

  title: String

  address: String

  lonlat: Point

  company: String

  lastActivityAt: String

  insertedAt: String

  updatedAt: String

  avatarCloudFile: CloudFile

  projects: [Project]

  jurisdictions: [Jurisdiction]

  groups: [Group]
}

type Group {
  "The ID of an object"
  id: ID!

  name: String

  insertedAt: String

  updatedAt: String
}

type Stamp {
  "The ID of an object"
  id: ID!

  name: String

  insertedAt: String

  updatedAt: String

  jurisdiction: Jurisdiction

  cloudFile: CloudFile
}


`;
