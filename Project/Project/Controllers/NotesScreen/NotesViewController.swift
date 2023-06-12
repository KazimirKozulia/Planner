//
//  NotesViewController.swift
//  Project
//
//  Created by Ghost on 18.03.23.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet
    var goToTheMap: UIBarButtonItem!
    
    @IBOutlet
    var tabBar: UITabBarItem!
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, Note>! = nil
    private var notesCollectionView: UICollectionView! = nil
    
    private var notes: [Note]?

    override func viewDidLoad() {
        super.viewDidLoad()
        backgroundStyle(imageName: "SecondBackgroundImage")
        title = L10n.YourNotes.Label.text
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(didTapAddButton)
        )
        
        configureCollectionView()
        configureDataSource()
        
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(moveToNextScreen(_:)))
        
        leftSwipe.direction = .left
        
        view.addGestureRecognizer(leftSwipe)
        
        goToTheMap.title = L10n.AddToMap.Button.title
        
        tabBar.title = L10n.Notes.TabBarItem.title
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchNotes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateCollectionView()
    }

    @IBAction
    func buttonTapped() {
        let mapScreen = UIStoryboard(name: "Map", bundle: .main).instantiateInitialViewController()
        self.navigationController?.pushViewController(mapScreen!, animated: true)
        
    }
    
    @objc
    func moveToNextScreen(_ sender:UISwipeGestureRecognizer) {
        switch sender.direction{
        case .left:
            self.tabBarController?.selectedIndex = 1
        default:
            break
        }
    }
    
    @objc
    private func didTapAddButton() {
        let addNoteVC = AddNoteViewController()
        addNoteVC.delegate = self
        let navVC = UINavigationController(rootViewController: addNoteVC)
        navVC.navigationBar.prefersLargeTitles = true
        navVC.modalPresentationStyle = .formSheet
        present(navVC, animated: true, completion: nil)
    }

    // Настройки представления
    private func createLayout() -> UICollectionViewLayout {
        var config = UICollectionLayoutListConfiguration(appearance: .plain)
        
        config.backgroundColor = .clear
        config.trailingSwipeActionsConfigurationProvider = { indexPath in
            let deleteAction = UIContextualAction(style: .destructive, title: L10n.ContextualAction.Delete.title) { [weak self] action, view, completion in
                self?.deleteItem(at: indexPath)
                completion(true)
            }
            return UISwipeActionsConfiguration(actions: [deleteAction])
        }
        
        return UICollectionViewCompositionalLayout.list(using: config)
    }
    
    private func configureCollectionView() {
        notesCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
        notesCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(notesCollectionView)
        notesCollectionView.backgroundColor = .clear
    }
    
    //Настройка источника данных
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Note> { cell, indexPath, note in
            var content = cell.defaultContentConfiguration()
            content.text = note.title
            content.textToSecondaryTextVerticalPadding = 8
            content.textProperties.font = UIFont.systemFont(ofSize: 18, weight: .medium)
            content.textProperties.color = .label
            content.secondaryTextProperties.font = UIFont.systemFont(ofSize: 16)
            content.secondaryTextProperties.color = .secondaryLabel
            
            let bodyTextArray = note.body.components(separatedBy: " ")
            
            if (bodyTextArray.count > 8) {
                var bodyText = bodyTextArray[0...8].joined(separator: " ")
                bodyText.append("...")
                content.secondaryText = bodyText
            } else {
                content.secondaryText = note.body
            }
            
            cell.contentConfiguration = content
            cell.accessories = [.disclosureIndicator()]
        }
        
        // Регистрация ячейки
        dataSource = UICollectionViewDiffableDataSource<Section, Note>(collectionView: notesCollectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, note: Note) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: note)
        }
        
        // snapshot - представление данных, при отображении
        var snapshot = NSDiffableDataSourceSnapshot<Section, Note>()
        snapshot.appendSections([.main])
        
        if let notes = notes {
            snapshot.appendItems(notes)
        }
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    //Методы получения данных из CoreData и для обновления интерфейса 
    private func fetchNotes() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext

        do {
            notes = try managedContext.fetch(Note.fetchRequest())
        } catch let error as NSError {
            fatalError("Unable to fetch. \(error) = \(error.userInfo)")
        }
    }
    
    private func updateCollectionView() {
        guard let notes = notes else {
            return
        }
        
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(notes)
        dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    private func deleteItem(at indexPath: IndexPath) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let note = self.dataSource.itemIdentifier(for: indexPath)
        
        guard let note = note else { return }
        
        managedContext.delete(note)
        
        do {
            try managedContext.save()
            var snapshot = dataSource.snapshot()
            
            snapshot.deleteAllItems()
            snapshot.appendSections([.main])
            dataSource.apply(snapshot)
            
            fetchNotes()
            updateCollectionView()
            
        } catch let error as NSError {
            fatalError("\(error.userInfo)")
        }
    }
}

extension NotesViewController: AddNoteViewControllerDelegate {
    func didFinishAddingNote() {
        fetchNotes()
        updateCollectionView()
    }
}
