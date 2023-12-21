//  return Scaffold(
//       appBar: AppBar(
//         title: const Text('Perfil do Usuário'),
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           child: Container(
//             width: 380,
//             height: 400,
//             child: Card(
//               elevation: 6,
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // Título "IDENTIFICATION CARD" centralizado
//                     const Center(
//                       child: Text(
//                         'IDENTIFICATION CARD',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 10),
//                     // Linha separadora
//                     Container(
//                       height: 1,
//                       color: Colors.grey,
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                     ),
//                     Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         // Foto do usuário
//                         Container(
//                           width: 120,
//                           height: 160,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10),
//                             border: Border.all(
//                               color: Colors.grey,
//                               width: 2,
//                             ),
//                           ),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               userData['image'],
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 20),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 'ID ${userData['id']}',
//                                 style: const TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 10),
//                               Text(
//                                 '${userData['firstName']} ${userData['lastName']}',
//                                 style: const TextStyle(
//                                   fontSize: 26,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 'Gênero: ${userData['gender']}',
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 'Username: ${userData['username']}',
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 'Email: ${userData['email']}',
//                                 style: const TextStyle(fontSize: 16),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );