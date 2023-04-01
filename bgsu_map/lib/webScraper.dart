Future<List<String>> extractData() async {
    //form connection to webpage
    final response =
        await http.Client().get(Uri.parse('https://www.geeksforgeeks.org/'));

        if (response.statusCode == 200) { //if connection is formed
            //get html; document from page
            var document = parser.parse(response.body);

            try {

                
            }  catch (e) {
        return ['', '', 'ERROR!'];
      }
    } else {
      return ['', '', 'ERROR: ${response.statusCode}.'];
    }

}