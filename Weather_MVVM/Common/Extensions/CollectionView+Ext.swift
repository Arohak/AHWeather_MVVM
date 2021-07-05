//
//  CollectionView+Ext.swift
//  MG2
//
//  Created by Ara Hakobyan on 07/03/2020.
//  Copyright © 2020 AroHak. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCell<Cell: UICollectionViewCell>(_ cellClass: Cell.Type) {
        register(cellClass, forCellWithReuseIdentifier: Cell.reuseId)
    }
    
    func registerHeader<Header: UICollectionReusableView>(_ headerClass: Header.Type) {
        register(headerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: Header.self))

    }
    
    func registerFooter<Footer: UICollectionReusableView>(_ footerClass: Footer.Type) {
        register(footerClass, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: Footer.self))

    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(_ indexPath: IndexPath) -> Cell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: Cell.reuseId, for: indexPath) as? Cell else {
            fatalError("fatal error for cell at \(indexPath)")
        }
        return cell
    }
    
    func dequeueHeaderView<Header: UICollectionReusableView>(_ indexPath: IndexPath) -> Header {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: Header.self), for: indexPath) as? Header else {
            fatalError("fatal error for header at \(indexPath)")
        }
        return header
    }
    
    func dequeueFooterView<Footer: UICollectionReusableView>(_ indexPath: IndexPath) -> Footer {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: Footer.self), for: indexPath) as? Footer else {
            fatalError("fatal error for header at \(indexPath)")
        }
        return footer
    }
}
