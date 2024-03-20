import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tapinvest/core/network/models/network_scheme_details.dart';

class APIs {
  //final DioClient _dioClient;
  APIs();

  Future<NetworkSchemeDetails> getSchemeDetails(String scheme) async {
    /*APIRequestRepresentable apiRequestRepresentable = APIRequestRepresentable(
        endpoint: 'v1/banks-master', method: HTTPMethod.get);
    Response response = await _dioClient.request(apiRequestRepresentable);*/
    return NetworkSchemeDetails.fromJson(jsonDecode(
        '{ "name": "Agrizy", "details": "Agrizy offers solutions across digital vendor management, and supply and value chainautomation to its agri processing units. Agrizy, a Bengaluru-based agri tech startup.", "highlights": "Agrizy was founded in 2021 by Vicky Dodani and Saket Chirania to provide an end-to-end solution to the agri processing market.", "minInvestment": 50000, "tenure": 61, "tenureUnit": "days", "netYield": 13.23, "capRaisedPercentage": 70, "capRaised": 69400000, "totalDeals": 18, "activeDeals": 6, "maturedDeals": 12, "onTimePaymentPercentage": 100, "invoiceDiscountingContract": "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf", "companyPitchDeck": "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf", "logo": "iVBORw0KGgoAAAANSUhEUgAAAFoAAABaCAYAAAA4qEECAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAATqSURBVHgB7Z09jBtFFMffrtfndSKR88V3xEgRdkvDQRca4nSkSZSkSkNNgUBKEbpcqIkERaCCIkWqgJLmrruDJilAIhUp7ROBjbgvg5Kcv3aH+W9ukX3nj1kz+6r3k06yvM/r3d+8nX2zOus5dIgg+P2sCp0LjksXSVGVBGMU0WNH/5Gbu1mpVJqD25zkRaPRmC8W8jeUok/n5grk+z65Xo5c1yXBjH63R+12m7rdDjkOfbnf6d2s1WotbItFQ3JhLr/h5XLLJ0olgmhhdvq9Hu3t7lA/DB93ur06ZMfpikyG5IXyoki2gJfPE1zCKdziPScIgipFYaO8tESelyfBHt1Oh3Z3tokiVXcpim4gi0WyfeYKhXiGUA5ddJVSy37RJyEbUFQ4jnPB1XfHZcwpQjagctNUpXbLmKQ8FtFMiGgmRDQTIpoJEc2EiGZCRDMhopkQ0UyIaCZENBMimgkRzYSIZkJEMyGimRDRTIhoJkQ0EyKaCRHNhIhmQkQzIaKZENFMiGgmRDQTIpoJEc2ERxkTtJv0rLtJ894iVfwq+e6xifGt3hY19n+L42vH3pq2e2pHL6nxEvHleP8mx1PMHaf5/CJxkpnoR3urtL7zvRbxYuj9d157n86dvHLkRCHs7p9fxNISEINYfGYUv/7zE63+dee/7xi374S1rTv0UB8XQFxd/3HhBH88VQvlstUfCf3w7JtYwjgg4mrl2lAGfr35GQWd5sj4SqFKV9+4NiQQA3O7eZ1a/a0j8ZB4pnT+yNXz3dPPUw2kDfBTuN3tbftz9MbOvYmSAaaHu8GtWBZ48vyXsZIBtt1qfExrOnsT2uGLkZLBuj6G25vXjY4DSYFBxusssSoaB4uTNI1NLuNJkgd52FqNxZjuH7EYoGkSk4FEfFbCrYrGTSwN0zJu3GdwQzMlHtDWmlEs9v2tnl42DJMlDVZFB53NVPGzZk/QTfc9T57/bBybXJXrlmVbFY15k4OiezxV/CylXHFKGZoWq+XdqcKbqeJnrWUrKb7H14Ny+fWPUsXXT16OqxabWBX97omzca1qSq04fUFymPpBnWwy7aBsO7/04dRFUgLkotzzLWczsCoaBwgRJjeTpIYFEL4xdd+vMu29g0zzc+Onj6peUZ5buGK0spwlfhasrwwhD9k2qaKANCxYkqkDJ4jsG/eZUZk5alDTLkAQf0lPK1kKTshkCX7p1KuDX9++d2RRgezBnHl4fsZnkKWPDmrrJHZSpkFqSe8H1Q6edWDqmnTZV/WVg5UhBvpM6YP46shimhhFJkvwQXBiyQoQwkxODFcEpGchAcdj8nDLFskSPPOnd7Ncllk+WeOYJkYhz6OZENFMiGgmRDQTIpoJEc2EiGZCRDMhopkQ0UyIaCZENBMimgkRzYSIZkJEMyGimRDRTIhoJkQ0EyKaCRHNhIhmQkQzIaKZENFMiGgmRDQTIpqJWHQUKRKyxSWHmlHYJyEb0LUT7VFdFakH7f02CdmA1qjoRes6iu7jv9LR5FCwC1qiwi2a/bqV06d/1Fn91d+tPQr7MoXYAi7RdxZu0VE5vhl2+v0VNKJF206MgvD/iH+3Apdo7qvd4r2hdtUFz1txXOeTpF21NycNJU1B5RbpLE7aVSOTIXmoXfUgcbPfMFxRDr2tNy6TYI6u4FSoHmhv9zElD276F3nD7xYdONc3AAAAAElFTkSuQmCC" }'));
  }
}

final apiProvider = Provider((ref) {
  return APIs();
});
