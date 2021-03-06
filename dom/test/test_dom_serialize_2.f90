program test_serialize_2

   use FoX_dom

   implicit none

   type(Node), pointer :: myDoc, root, np, dummy
   type(DOMException) :: ex

   ! Create a new document and get a pointer to the root element, this gives you the minimum empty dom
   myDoc => createDocument(getImplementation(), "http://www.example.com", "root-element", null())
   root => getDocumentElement(myDoc)

   ! You can now do DOMish things like create new elements and append them to the document root element 
   ! dummy ends up pointing at the child-element
   np => createElementNS(myDoc, "http://www.example.com", "child-element")
   dummy => appendChild(root, np)

   ! Call serialize to produce the document
   call serialize(myDoc, "test.xml", ex)

   ! And don't forget to clean up the memory
   call destroy(myDoc)

end program test_serialize_2

