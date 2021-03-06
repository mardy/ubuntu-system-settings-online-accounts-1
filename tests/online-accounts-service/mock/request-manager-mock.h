/*
 * Copyright (C) 2014 Canonical Ltd.
 *
 * Contact: Alberto Mardegan <alberto.mardegan@canonical.com>
 *
 * This file is part of online-accounts-ui
 *
 * This program is free software: you can redistribute it and/or modify it
 * under the terms of the GNU General Public License version 3, as published
 * by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful, but
 * WITHOUT ANY WARRANTY; without even the implied warranties of
 * MERCHANTABILITY, SATISFACTORY QUALITY, or FITNESS FOR A PARTICULAR
 * PURPOSE.  See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef MOCK_REQUEST_MANAGER_H
#define MOCK_REQUEST_MANAGER_H

#include "request-manager.h"

#include <QObject>

namespace OnlineAccountsUi {

class RequestManagerPrivate: public QObject
{
    Q_OBJECT
    Q_DECLARE_PUBLIC(RequestManager)

public:
    RequestManagerPrivate(RequestManager *q);
    ~RequestManagerPrivate();
    static RequestManagerPrivate *mocked(RequestManager *q) { return q->d_ptr; }

Q_SIGNALS:
    void enqueueCalled(Request *request);

public:
    mutable RequestManager *q_ptr;
};

} // namespace

#endif // MOCK_REQUEST_MANAGER_H
