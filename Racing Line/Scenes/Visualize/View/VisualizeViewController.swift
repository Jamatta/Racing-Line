//
//  VisualizeViewController.swift
//  Racing Line
//
//  Created by Nika Jamatashvili on 21.01.24.
//

import UIKit
import SwiftUI

class VisualizeViewController: UIViewController {
    
    //MARK: - Properties
    let visualizeView = VisualizeView()
    var hostingController: UIHostingController<VisualizeView>!
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHostingController()
    }
    
    //MARK: - Methods
    private func setupView() {
        navigationBarSetup()
    }
    
    private func navigationBarSetup() {
        let navigationBar = UINavigationBar()
        navigationBar.backgroundColor = UIColor(AppColors.background)
        navigationBar.topItem?.title = "some title"
        
        view.addSubview(navigationBar)
        
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            navigationBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func setupHostingController() {
        hostingController = UIHostingController(rootView: visualizeView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.didMove(toParent: self)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

struct VisualizeView: View {
    
    //MARK: - Properties
    @State private var selectedCircuit: CircuitData?
    @State private var isModalPresented = false
    
    let circuits = [
        CircuitData(name: "Spa",
                    location: "Stavelot, Belgium",
                    description: "Circuit de Spa-Francorchamps is renowned for its picturesque track layout, including iconic corners like Eau Rouge and Blanchimont.",
                    imageName: "spabg",
                    circuitShape: AnyShape(Spa())
                   ),
        
        CircuitData(name: "Suzuka",
                    location: "Suzuka City, Japan",
                    description: "Suzuka Circuit is famous for its unique figure-eight layout and challenging corners, such as the 'S' Curves and 130R.",
                    imageName: "suzukabg",
                    circuitShape: AnyShape(Suzuka())
                   ),
        
        CircuitData(name: "Monza",
                    location: "Monza, Italy",
                    description: "Autodromo Nazionale Monza is one of the oldest racing circuits, featuring long straights and high-speed chicanes.",
                    imageName: "monzabg",
                    circuitShape: AnyShape(Monza())
                   ),
        
        CircuitData(name: "Silverstone",
                    location: "England",
                    description: "Known as the 'Home of British Motor Racing', Silverstone Circuit boasts a high-speed layout and rich Formula One history.",
                    imageName: "silverstonebg",
                    circuitShape: AnyShape(Silverstone())
                   ),
        
        CircuitData(name: "Monaco",
                    location: "Monte Carlo, Monaco",
                    description: "Circuit de Monaco hosts the prestigious Monaco Grand Prix on its narrow and winding streets, offering a challenging and glamorous race.",
                    imageName: "monacobg",
                    circuitShape: AnyShape(Monaco())
                   )
    ]
    
    //MARK: - Body
    var body: some View {
        NavigationView {
            ScrollView {
                Rectangle()
                    .frame(width: 0, height: 24)
                    .background(AppColors.background)
                
                ForEach(circuits, id: \.name) { circuit in
                    CircuitCardView(name: circuit.name,
                                    location: circuit.location,
                                    description: circuit.description,
                                    imageName: circuit.imageName)
                    .padding(.bottom, 40)
                    .onTapGesture {
                        selectedCircuit = circuit
                    }
                }
            }
            .navigationTitle("Simulating")
            .sheet(item: $selectedCircuit) { circuit in
                VStack {
                    SimulatingFilterView(selectedCircuit: circuit)
                }
                .background(AppColors.background)
                .cornerRadius(16)
            }
        }
    }
}

